import 'package:apollocode_flutter_widgets/services/auth.dart';
import 'package:apollocode_flutter_widgets/widgets/loading.dart';
import 'package:apollocode_flutter_widgets/widgets/not_found.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AdminGuard extends StatelessWidget {
  final Widget body;
  final Widget loading;
  final Widget notFound;

  const AdminGuard(this.body, {Key? key, this.loading = const Loading(), this.notFound = const NotFound()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: Auth.getToken(),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading;
        }

        if (snapshot.data == null) {
          return const NotFound();
        }

        Map<String, dynamic> decodedToken = JwtDecoder.decode(snapshot.data!);
        
        if (decodedToken['role'] != "admin") {
          return const NotFound();
        }

        return body;
      },
    );
  }
}
