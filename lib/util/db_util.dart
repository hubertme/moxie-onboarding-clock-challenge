import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';

class DBUtil {
  DBUtil._();

  static List<Alarm> fetchAllAlarmsFromHive() {
    List<dynamic> hiveData = HiveUtil.getValue(HiveUtilKeys.ALARMS);
    if (hiveData == null) {
      return [];
    }

    final List<Alarm> allAlarms = hiveData.map((data) {
      final json = new Map<String, dynamic>.from(data);
      return Alarm.fromJson(json);
    }).toList();

    return allAlarms;
  }
}