import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreManager {
  static late LocalStoreManager _instance;
  static var _isInitialized = false;

  static late Map<String, dynamic> _storage;
  static late Map<Type, Function(Map<String, dynamic>)> _decoders;

  static LocalStoreManager get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'LocalStoreManager must be initialized before to get an instance.',
    );
  }

  LocalStoreManager._();

  static initialize(Map<Type, Function(Map<String, dynamic>)> decoders) async {
    if (!_isInitialized) {
      _instance = LocalStoreManager._();
      _decoders = decoders;
      final prefs = await SharedPreferences.getInstance();
      String? storageString = prefs.getString("local_store");
      try {
        Map<String, dynamic> storage =
            (storageString != null) ? jsonDecode(storageString) : {};
        _storage = storage;
      } catch (_) {
        _storage = {};
      }
      _isInitialized = true;
    }
  }

  static List<T> getValues<T>(String key) {
    var fromStorage = _storage[key];
    var decoder = _decoders[T];
    assert(decoder != null, 'Unknown decoder');
    assert(fromStorage is List || fromStorage == null,
        'Value isn\'t a list or a null');

    var decodedData = <T>[];

    for (var i = 0; i < (fromStorage as List).length; i++) {
      if (fromStorage[i] is T) {
        decodedData.add(fromStorage[i]);
      } else {
        decodedData.add(decoder!(fromStorage[i]));
      }
    }

    return decodedData;
  }

  static T? getValue<T>(String key) {
    var fromStorage = _storage[key];
    var decoder = _decoders[T];
    assert(decoder != null, 'Unknown decoder');
    return (fromStorage is T) ? fromStorage : decoder!(fromStorage);
  }

  static setValues<T>(String key, List<T> values) {
    _storage[key] = values;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("local_store", jsonEncode(_storage));
    });
  }

  static setValue<T>(String key, T value) {
    _storage[key] = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("local_store", jsonEncode(_storage));
    });
  }
}
