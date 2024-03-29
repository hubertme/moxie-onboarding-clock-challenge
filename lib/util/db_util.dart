import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/util/formatter_util.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';

class DBUtil {
  DBUtil._();

  static List<Alarm> fetchAllAlarmsFromHive({bool sorted = true}) {
    List<dynamic> hiveData = HiveUtil.getValue(HiveUtilKeys.ALARMS);
    if (hiveData == null) {
      return [];
    }

    final List<Alarm> allAlarms = hiveData.map((data) {
      final json = new Map<String, dynamic>.from(data);
      return Alarm.fromJson(json);
    }).toList();

    if (sorted) {
      allAlarms.sort((prev, next) {
        final prevSeconds = prev.hour * 3600 + prev.minute * 60;
        final nextSeconds = next.hour * 3600 + next.minute * 60;

        return prevSeconds - nextSeconds;
      });
    }
    return allAlarms;
  }
}