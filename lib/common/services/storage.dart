import 'package:shared_preferences/shared_preferences.dart';

class StorageStorage {
  late final SharedPreferences _pref;

  Future<StorageStorage> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }
}
