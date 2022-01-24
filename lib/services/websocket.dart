import 'dart:convert';

import 'package:apollocode_flutter_utilities/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:eventify/eventify.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketService {
  static EventEmitter emitter = EventEmitter();
  static WebSocketChannel? channel;
  static bool isWaitingOnReconnect = false;
  static bool printEventsToConsole = false;

  static Future init(String url, {bool useAuth = true}) async {
    Uri uri;

    if (useAuth) {
      var token = await Auth.getToken();
      uri = Uri.parse('$url?authorization=$token');
    } else {
      uri = Uri.parse(url);
    }
    if (channel != null && channel?.closeCode == null) {
      return;
    }
    channel = WebSocketChannel.connect(uri);

    channel!.stream.listen((message) => _handleMessage(message),
        onError: (error) {
      debugPrint("ERROR $error");
    }, onDone: () async {
      if (!isWaitingOnReconnect) {
        isWaitingOnReconnect = true;
        await Future.delayed(const Duration(seconds: 5));
        isWaitingOnReconnect = false;
      }
    });

    channel!.stream.handleError((error) {
      debugPrint("ERROR: $error");
    });
  }

  static void _handleMessage(dynamic args) {
    Map<String, dynamic> castedArgs = jsonDecode(args.toString());
    if (WebsocketService.printEventsToConsole) {
      debugPrint(castedArgs['channel']);
    }
    WebsocketService.emitter.emit(castedArgs['channel'], castedArgs['data']);
  }

  static void sendMessage(String event, dynamic data) {
    var dataRaw = {"event": event, "data": data};

    var dataToSend = jsonEncode(dataRaw);

    channel!.sink.add(dataToSend);
  }
}
