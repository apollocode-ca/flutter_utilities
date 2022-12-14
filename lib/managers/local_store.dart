import 'dart:convert';

import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LocalStoreManager {
  static late LocalStoreManager _instance;
  static var _isInitialized = false;

  static late Map<String, dynamic> _storage;

  static LocalStoreManager get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'LocalStoreManager must be initialized before to get an instance.',
    );
  }

  LocalStoreManager._(BuildContext context) {
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      String? storageString = prefs.getString("local_store");
      try {
        Map<String, dynamic> storage =
            (storageString != null) ? jsonDecode(storageString) : {};

        _storage = storage;
      } catch (_) {
        _storage = {};
      }
    });
  }

  static void initialize(BuildContext context) {
    if (!_isInitialized) {
      _instance = LocalStoreManager._(context);
      _isInitialized = true;
    }
  }

  static List<T> getValues<T extends Entity>(String key) {
    return _storage[key] ?? <T>[];
  }

  static setValues<T extends Entity>(String key, List<T> values) {
    _storage[key] = values;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("local_store", jsonEncode(_storage));
    });
  }
}
