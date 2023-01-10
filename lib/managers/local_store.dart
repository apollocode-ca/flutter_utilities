import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manager that handles storage of data on the disk.
/// Usually used as a way to cache API responses to delivers instantanious data
/// to the user.
///
/// The main benefit of using this manager is the ability to read/write on the
/// disk in a synchronous matter, compared to async when using standard shared_preferences
class LocalStoreManager {
  /// Stores the local instance as a Singleton to
  /// prevent multiple instance
  static late LocalStoreManager _instance;

  /// true if the manager has been initialized
  static var _isInitialized = false;

  late Map<Type, Function(Map<String, dynamic>)> _decoders;
  late Map<String, dynamic> _storage;
  late SharedPreferences _prefs;
  late String _version;
  late _LocalStore _localStore;

  /// Returns the current instance of the manager
  /// [StateError] is thrown if no instance is found
  static LocalStoreManager get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'LocalStoreManager must be initialized before to get an instance.',
    );
  }

  /// Private constructor to instantiate the manager
  LocalStoreManager._(Map<Type, Function(Map<String, dynamic>)> decoders,
      SharedPreferences prefs, String version, bool clearStorageOnNewVersion) {
    _decoders = decoders;
    _prefs = prefs;
    _version = version;

    final storageString = prefs.getString("local_store");
    _storage = {};

    try {
      _localStore = (storageString != null)
          ? _LocalStore.fromJson(storageString)
          : _LocalStore(version: version, keys: []);
    } catch (_) {
      _localStore = _LocalStore(version: version, keys: []);
    }

    if (_localStore.version != version && clearStorageOnNewVersion) {
      _localStore = _LocalStore(version: version, keys: []);
    }

    for (var key in _localStore.keys) {
      var data = prefs.getString(key);

      if (data != null) {
        try {
          _storage[key] = jsonDecode(data);
        } catch (_) {}
      }
    }
  }

  /// Initializes an instance of the LocalStoreManager
  ///
  /// [decoders] is a list of <Key, Value> pairs representing
  /// a type and a JSON decoder function. Example : { Class: Class.fromMap }
  ///
  /// A [version] can be set to instantiate a version aware localStore
  /// If [clearStorageOnNewVersion] is set to true, the manager deletes
  /// all the stored data from a previous version
  static initialize(Map<Type, Function(Map<String, dynamic>)> decoders,
      {String version = "1.0.0", bool clearStorageOnNewVersion = false}) async {
    if (!_isInitialized) {
      final prefs = await SharedPreferences.getInstance();
      _instance = LocalStoreManager._(
          decoders, prefs, version, clearStorageOnNewVersion);
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
    _updateStore();
  }

  setValue<T>(String key, T value) {
    _storage[key] = value;
    _updateStore();
  }

  resetKey(String key) {
    _storage.remove(key);
    _updateStore();
  }

  clearStore() {
    _storage = {};
    _updateStore();
  }

  _updateStore() {
    var store = _LocalStore(version: _version, keys: []);
    _storage.forEach((key, value) {
      store.keys.add(key);
      _prefs.setString('store_$key', jsonEncode(value));
    });

    _prefs.setString(
        'local_store', jsonEncode(store));
  }
}

class _LocalStore {
  String version;
  List<String> keys;
  _LocalStore({
    required this.version,
    required this.keys,
  });

  _LocalStore copyWith({
    String? version,
    List<String>? keys,
  }) {
    return _LocalStore(
      version: version ?? this.version,
      keys: keys ?? this.keys,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'keys': keys,
    };
  }

  factory _LocalStore.fromMap(Map<String, dynamic> map) {
    return _LocalStore(
      version: map['version'] ?? '',
      keys: List<String>.from(map['keys']),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory _LocalStore.fromJson(String source) =>
      _LocalStore.fromMap(json.decode(source));

  @override
  String toString() => '_LocalStore(version: $version, keys: $keys)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _LocalStore &&
        other.version == version &&
        listEquals(other.keys, keys);
  }

  @override
  int get hashCode => version.hashCode ^ keys.hashCode;
}
