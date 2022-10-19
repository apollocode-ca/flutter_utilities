import 'package:flutter/material.dart';

class MetamaskNotifier extends ChangeNotifier {
  var _address = '';
  var _isConnected = false;

  String get address {
    return _address;
  }

  bool get isConnected {
    return _isConnected;
  }

  set address(String value) {
    _address = value;
    notifyListeners();
  }

  set isConnected(bool value) {
    _isConnected = value;
    notifyListeners();
  }
}
