import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefControl {
  static const String SAVEDPARKINGS = 'SAVEDPARKINGS';

  static Future<List<String>> getString(String key) async {
    final p = await prefs;
    return p.getStringList(key) ?? List.empty();
  }

  static Future setString(String key, List<String> value) async {
    final p = await prefs;
    return p.setStringList(key, value);
  }

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<List<String>> getFavParkings() {
    return getString(SAVEDPARKINGS);
  }

  static Future toggleFavParking(String value) {
    getString(SAVEDPARKINGS).then((List<String> v) {
      if (v.contains(value)) {
        setString(
            SAVEDPARKINGS, v.where((element) => element != value).toList());
      } else {
        setString(SAVEDPARKINGS, v + [value]);
      }
    });
  }

  static Future<bool> parkingIsFav(String parkingId) {
    return getString(SAVEDPARKINGS).then((value) => value.contains(parkingId));
  }
}
