import 'package:flutter/material.dart';

class MetamaskNotifier extends ChangeNotifier {
  var _isConnected = false;

  bool get isConnected {
    return _isConnected;
  }

  set isConnected(bool value) {
    _isConnected = value;
    notifyListeners();
  }
}
