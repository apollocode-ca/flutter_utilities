import 'package:apollocode_flutter_utilities/services/websocket.dart';
import 'package:flutter/material.dart';

class WebsocketGuard extends StatelessWidget {
  final Widget body;
  final String endpoint;
  final bool useAuth;

  const WebsocketGuard(this.body, this.endpoint,
      {Key? key, this.useAuth = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WebsocketService.init(endpoint, useAuth: useAuth),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return body;
      },
    );
  }
}
