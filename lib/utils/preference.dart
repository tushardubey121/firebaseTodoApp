import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  final isUserLogin = "isUserLogin";
  final userDetail = "userDetail";

  static final Preference _preference = Preference._();

  factory Preference() => _preference;

  Preference._();

  SharedPreferences? _prefs;

  Future<SharedPreferences> load() async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  Future<bool> clearPref() async {
    bool clear = await _prefs!.clear();
    return clear;
  }

  void setString(String key, String value) {
    _prefs!.setString(key, value);
  }

  void setListString(String key, List<String> value) {
    _prefs!.setStringList(key, value);
  }

  void setInt(String key, int value) {
    _prefs!.setInt(key, value);
  }

  void setDouble(String key, double value) {
    _prefs!.setDouble(key, value);
  }

  void setBool(String key, bool value) {
    _prefs!.setBool(key, value);
  }

  String getString(String key, {String def = ''}) {
    String? val = _prefs!.getString(key);
    val ??= def;
    return val;
  }

  List<String>? getListString(String key, {List<String>? def}) {
    List<String>? val = _prefs!.getStringList(key);
    val ??= def;
    return val;
  }

  bool exists(String key) {
    return _prefs!.containsKey(key);
  }

  int getInt(String key, {int def = 0}) {
    int? val = _prefs!.getInt(key);
    val ??= def;
    return val;
  }

  double getDouble(String key, {double def = 0.0}) {
    double? val = _prefs!.getDouble(key);
    val ??= def;
    return val;
  }

  bool getBool(String key, {bool def = false}) {
    bool? val = _prefs!.getBool(key);
    val ??= def;
    return val;
  }
}
