import 'package:apollocode_flutter_utilities/services/websocket.dart';
import 'package:flutter/material.dart';

class WebsocketGuard extends StatelessWidget {
  final Widget body;
  final String token;
  final String endpoint;

  const WebsocketGuard(
    this.body,
    this.token,
    this.endpoint, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WebsocketService.init(token, endpoint),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return body;
      },
    );
  }
}
