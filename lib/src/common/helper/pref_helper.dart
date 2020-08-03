import 'helper.dart';

class PrefHelper {
  static const LAST_CHECKED = "last_checked";
  static const CHECK_INTERVAL = "check_interval";
  static const DATA = "data";

  static Future<bool> storeCache(String key, String json,
      {int lastChecked, int interval = 600000}) {
    if (lastChecked == null) {
      lastChecked = DateTime.now().millisecondsSinceEpoch;
    }
    return SharedPreferences.getInstance().then((prefs) {
      return prefs.setString(
          key,
          jsonEncode({
            LAST_CHECKED: lastChecked,
            CHECK_INTERVAL: interval,
            DATA: json
          }));
    });
  }

  static Future<String> getCache(String key) async {
    var prefs = await SharedPreferences.getInstance();
    Map map = jsonDecode(prefs.getString(key));
    var lastChecked = map[LAST_CHECKED];
    var interval = map[CHECK_INTERVAL];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      prefs.remove(key);
      return null;
    }
    return map[DATA];
  }

  static Future<Map> getFullCache(String key) async {
    var prefs = await SharedPreferences.getInstance();
    Map map = jsonDecode(prefs.getString(key));
    var lastChecked = map[LAST_CHECKED];
    var interval = map[CHECK_INTERVAL];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      prefs.remove(key);
      return null;
    }
    return map;
  }
}