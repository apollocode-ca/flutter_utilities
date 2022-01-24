import 'package:apollocode_flutter_utilities/services/auth.dart';
import 'package:apollocode_flutter_utilities/widgets/loading.dart';
import 'package:apollocode_flutter_utilities/widgets/not_found.dart';
import 'package:flutter/material.dart';

class FirebaseGuard extends StatelessWidget {
  final Widget body;
  final Widget loading;
  final Widget notFound;
  static String? email;

  const FirebaseGuard(this.body,
      {Key? key,
      this.loading = const Loading(),
      this.notFound = const NotFound()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: Auth.loginFromUrl(context),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading;
        }
        if (snapshot.data != null) {
          email = snapshot.data!["email"];
        }

        return body;
      },
    );
  }
}
