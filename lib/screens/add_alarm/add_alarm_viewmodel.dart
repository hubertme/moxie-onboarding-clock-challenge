import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';
import 'package:rxdart/rxdart.dart';

class AddAlarmViewModel {
  BehaviorSubject<bool> _addToDBProcess = BehaviorSubject();
  Stream<bool> get addToDBProcessObservable => _addToDBProcess.stream;

  void dispose() {
    this._addToDBProcess.close();
  }

  void saveAlarmToDB(TimeOfDay timeOfDay) async {
    try {
      final alarm = Alarm(hour: timeOfDay.hour, minute: timeOfDay.minute);

      List<dynamic> allAlarms = HiveUtil.getValue(HiveUtilKeys.ALARMS);
      print('All alarms: $allAlarms');
      if (allAlarms == null) {
        allAlarms = [];
      }

      allAlarms.add(alarm.toJson());
      HiveUtil.setValue(HiveUtilKeys.ALARMS, allAlarms);

      _addToDBProcess.add(true);
    } catch (e) {
      print('Error in saveAlarmToDB: $e');
      _addToDBProcess.add(false);
    }
  }
}