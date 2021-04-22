import 'package:hive/hive.dart';

class HiveUtilKeys {
  HiveUtilKeys._();

  static const ALARMS = 'hive/alarms';
}

class HiveUtil {
  HiveUtil._() {}
  static Box _defaultBox;

  // static Box get box => _defaultBox;

  static void openDefaultBox(String path) async {
    try {
      Hive.init(path);
      _defaultBox = await Hive.openBox('wang.hihubert.onboardingClockChallenge');

      print('Hive box opened: $_defaultBox');
    } catch (e) {
      print('Hive box failed to open: $e');
    }
  }

  static void setValue(String key, dynamic value) {
    _defaultBox.put(key, value);
  }

  static dynamic getValue(String key) {
    return _defaultBox.get(key);
  }

  static void deleteKey(String key) {
    _defaultBox.delete(key);
  }
}