import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveSuccessCount(int successCount) async {
    final _pref = await SharedPreferences.getInstance();
    _pref.setInt('successCount', successCount);
  }

  static Future<int?> readSuccessCount() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getInt('successCount');
  }
}
