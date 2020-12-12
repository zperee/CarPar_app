import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefControl {
  static const String SAVEDPARKINGS = 'SAVEDPARKINGS';

  static Future<String> getString(String key) async {
    final p = await prefs;
    return p.getString(key) ?? '';
  }

  static Future setString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<List<String>> getFavParkings() {
    return getString(SAVEDPARKINGS).then((value) => value.split(";"));
  }

  static Future saveFavParking(String value) {
    getString(SAVEDPARKINGS)
        .then((v) => setString(SAVEDPARKINGS, v + value + ";"));
  }

  static Future<bool> parkingIsFav(String parkingId) {
    return getString(SAVEDPARKINGS).then((value) => value.contains(parkingId));
  }
}
