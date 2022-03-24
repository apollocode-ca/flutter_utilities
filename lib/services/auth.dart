import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  static User? get user => FirebaseAuth.instance.currentUser;

  static Future<bool> isAuth({bool defaultToAnonymous = false}) async {
    var user = await FirebaseAuth.instance.userChanges().first;

    if (user == null && defaultToAnonymous) {
      await Auth.anonymousLogin();
    }

    return user != null;
  }

  static Future<String?> getToken() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();

    return token;
  }

  static Future<String?> getRefreshToken() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    var token = FirebaseAuth.instance.currentUser?.refreshToken;
    return token;
  }

  static Future<UserCredential> authenticateUser(
      String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  static Future<UserCredential> anonymousLogin() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    return userCredential;
  }

  static Future<UserCredential> registerUser(
      BuildContext context, String email, String newPassword) async {
    // await authenticateUser(email, newPassword);

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: newPassword);

    return userCredential;
  }

  static Future<void> disconnectUser({BuildContext? context}) async {
    await FirebaseAuth.instance.signOut();

    if (context != null) {
      Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => true);
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    }

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw Error();
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<UserCredential> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  static Future<UserCredential> signInWithFacebook() async {
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(facebookProvider);
  }

  static Future<dynamic> loginFromUrl(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var url = ModalRoute.of(context)!.settings.name!;
    if (!url.contains('/firebase/')) {
      return null;
    }
    var email = Uri.parse(url)
        .toString()
        .split('/?')[1]
        .toString()
        .split('&')[0]
        .toString()
        .split('=')[1]
        .toString()
        .replaceAll('%2B', '+')
        .replaceAll('%40', '@');
    await FirebaseAuth.instance
        .signInWithEmailLink(email: email, emailLink: url);

    return {
      "email": email,
    };
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
