import 'package:apollocode_flutter_utilities/services/auth.dart';
import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:apollocode_flutter_utilities/widgets/not_found.dart';
import 'package:flutter/material.dart';

class AuthGuard extends StatelessWidget {
  final Widget body;
  final bool mustBeConnected;
  final bool defaultToAnonymous;
  final bool allowAnonymous;
  final Widget loading;
  final Widget notFound;
  static String? pathAfterConnection;

  Future goToLogin(BuildContext context) async {
    await Future.delayed(Duration.zero);

    Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
  }

  AuthGuard(this.body,
      {Key? key,
      this.mustBeConnected = true,
      this.defaultToAnonymous = false,
      this.allowAnonymous = true,
      String? pathAfterConnection,
      this.loading = const Loading(),
      this.notFound = const NotFound()})
      : super(key: key) {
    // ignore: prefer_initializing_formals
    AuthGuard.pathAfterConnection = pathAfterConnection;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Auth.isAuth(defaultToAnonymous: defaultToAnonymous),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading;
        }

        if ((snapshot.data == false && mustBeConnected) || (Auth.user!.isAnonymous && !allowAnonymous)) {
            goToLogin(context);
            return loading;
        }

        return body;
      },
    );
  }
}
