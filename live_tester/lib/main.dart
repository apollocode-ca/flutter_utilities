import 'package:live_tester/src/live_tester_app.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

void main() {
  Beamer.setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const LiveTesterApp(),
  );
}
