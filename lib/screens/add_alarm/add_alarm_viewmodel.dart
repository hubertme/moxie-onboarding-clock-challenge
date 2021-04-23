import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/providers/alarm_provider.dart';
import 'package:onboarding_clock_challenge/screens/all_alarm/all_alarm_viewmodel.dart';
import 'package:onboarding_clock_challenge/util/db_util.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class AddAlarmViewModel {
  BehaviorSubject<bool> _addToDBProcess = BehaviorSubject();
  Stream<bool> get addToDBProcessObservable => _addToDBProcess.stream;

  void dispose() {
    this._addToDBProcess.close();
  }

  void saveAlarmToDB(BuildContext context, TimeOfDay timeOfDay) async {
    try {
      final alarm = Alarm(hour: timeOfDay.hour, minute: timeOfDay.minute);

      List<dynamic> allAlarms = HiveUtil.getValue(HiveUtilKeys.ALARMS);
      print('All alarms: $allAlarms');
      if (allAlarms == null) {
        allAlarms = [];
      }

      allAlarms.add(alarm.toJson());
      HiveUtil.setValue(HiveUtilKeys.ALARMS, allAlarms);
      _refreshAllAlarms(context);

      _addToDBProcess.add(true);
    } catch (e) {
      print('Error in saveAlarmToDB: $e');
      _addToDBProcess.add(false);
    }
  }

  void _refreshAllAlarms(BuildContext context) {
    final allAlarms = DBUtil.fetchAllAlarmsFromHive();
    Provider.of<AlarmProvider>(context, listen: false).updateAllAlarms(allAlarms);
  }
}