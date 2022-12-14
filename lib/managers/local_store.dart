import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreManager {
  static late LocalStoreManager _instance;
  static var _isInitialized = false;

  late Map<Type, Function(Map<String, dynamic>)> _decoders;
  late Map<String, dynamic> _storage;
  late SharedPreferences _prefs;

  static LocalStoreManager get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'LocalStoreManager must be initialized before to get an instance.',
    );
  }

  LocalStoreManager._(
    Map<Type, Function(Map<String, dynamic>)> decoders,
    SharedPreferences prefs,
  ) {
    _decoders = decoders;
    _prefs = prefs;
    final storageString = prefs.getString("local_store");
    try {
      _storage = storageString != null ? jsonDecode(storageString) : {};
    } catch (_) {
      _storage = {};
    }
  }

  static initialize(Map<Type, Function(Map<String, dynamic>)> decoders) async {
    if (!_isInitialized) {
      final prefs = await SharedPreferences.getInstance();
      _instance = LocalStoreManager._(decoders, prefs);
      _isInitialized = true;
    }
  }

  List<T> getValues<T>(String key) {
    var fromStorage = _storage[key];
    var decoder = _decoders[T];
    if (decoder == null) {
      throw StateError('Unknown decoder');
    }
    if (fromStorage == null) {
      return [];
    }
    if (fromStorage is! List) {
      throw StateError("Value isn't a list");
    }

    var decodedData = <T>[];

    for (var i = 0; i < fromStorage.length; i++) {
      if (fromStorage[i] is T) {
        decodedData.add(fromStorage[i]);
      } else {
        decodedData.add(decoder(fromStorage[i]));
      }
    }

    return decodedData;
  }

  T? getValue<T>(String key) {
    var fromStorage = _storage[key];
    if (fromStorage == null) {
      return null;
    }
    var decoder = _decoders[T];
    if (decoder == null) {
      throw StateError('Unknown decoder');
    }
    return fromStorage is T ? fromStorage : decoder(fromStorage);
  }

  setValues<T>(String key, List<T> values) {
    _storage[key] = values;
    _prefs.setString('local_store', jsonEncode(_storage));
  }

  setValue<T>(String key, T value) {
    _storage[key] = value;
    _prefs.setString('local_store', jsonEncode(_storage));
  }
}
