import 'package:apollocode_flutter_utilities/services/auth.dart';
import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:apollocode_flutter_utilities/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthGuard extends StatelessWidget {
  final Widget body;
  final bool mustBeConnected;
  final bool defaultToAnonymous;
  final bool allowAnonymous;
  final Widget loading;
  final Widget notFound;
  final String pathToLogin;
  final bool useGoRouter;
  static String? pathAfterConnection;

  Future goToLogin(BuildContext context) async {
    await Future.delayed(Duration.zero);

    if (!useGoRouter) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(pathToLogin, (route) => false);
      return;
    }

    GoRouter.of(context).go(pathToLogin);
  }

  AuthGuard(this.body,
      {Key? key,
      this.mustBeConnected = true,
      this.defaultToAnonymous = false,
      this.allowAnonymous = true,
      String? pathAfterConnection,
      this.pathToLogin = "/login",
      this.loading = const Loading(),
      this.notFound = const NotFound(),
      this.useGoRouter = false})
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

        if ((snapshot.data == false && mustBeConnected) ||
            (Auth.user?.isAnonymous == true && !allowAnonymous)) {
          goToLogin(context);
          return loading;
        }

        return body;
      },
    );
  }
}
