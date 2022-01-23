import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<bool> writeData(String key, String value) async {
    var _storage = await SharedPreferences.getInstance();
    return await _storage
        .setString(key, value)
        .then((value) => true)
        .catchError((error) => false);
  }

  static Future<String?> readData(String key) async {
    var _storage = await SharedPreferences.getInstance();
    var readData = _storage.getString(key);
    return readData;
  }

  static Future deleteData(String key) async {
    var _storage = await SharedPreferences.getInstance();
    await _storage.remove(key);
  }
}
