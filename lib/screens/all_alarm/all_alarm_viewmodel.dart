import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/providers/alarm_provider.dart';
import 'package:onboarding_clock_challenge/util/db_util.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class AllAlarmViewModel {
  void dispose() {

  }

  void fetchAllAlarms(BuildContext context) {
    final allAlarms = DBUtil.fetchAllAlarmsFromHive();
    Provider.of<AlarmProvider>(context, listen: false).updateAllAlarms(allAlarms);
  }

  void handleAlarmSwitch(BuildContext context, Alarm alarm, bool currentState) {
    final allAlarms = DBUtil.fetchAllAlarmsFromHive();
    final filter = allAlarms.where((element) => element.id == alarm.id).toList();

    if (filter != null && filter.length > 0) {
      final updateAlarm = filter[0];
      updateAlarm.isActive = currentState;

      allAlarms[allAlarms.indexWhere((element) => element.id == alarm.id)] = updateAlarm;
      HiveUtil.setValue(HiveUtilKeys.ALARMS, allAlarms.map((e) => e.toJson()).toList());
      Provider.of<AlarmProvider>(context, listen: false).updateAllAlarms(allAlarms);
    }
  }
}