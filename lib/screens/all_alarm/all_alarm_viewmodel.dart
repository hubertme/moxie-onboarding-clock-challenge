import 'dart:convert';

import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';
import 'package:rxdart/rxdart.dart';

class AllAlarmViewModel {
  BehaviorSubject<List<Alarm>> _allAlarmsObservable = BehaviorSubject();
  Stream<List<Alarm>> get getAllAlarmsObservable => _allAlarmsObservable.stream;

  void dispose() {
    _allAlarmsObservable.close();
  }

  void fetchAllAlarms() {
    List<dynamic> hiveData = HiveUtil.getValue(HiveUtilKeys.ALARMS);
    print('Hive data: $hiveData');
    if (hiveData == null) {
      hiveData = [];
    }

    final List<Alarm> allAlarms = hiveData.map((data) => Alarm(hour: data['hour'], minute: data['minute'], isActive: data['isActive'])).toList();
    _allAlarmsObservable.add(allAlarms);
  }
}