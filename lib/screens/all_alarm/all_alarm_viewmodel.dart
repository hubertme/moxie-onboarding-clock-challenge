import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:onboarding_clock_challenge/models/alarm.dart';
import 'package:onboarding_clock_challenge/providers/alarm_provider.dart';
import 'package:onboarding_clock_challenge/util/hive_util.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class AllAlarmViewModel {
  // BehaviorSubject<List<Alarm>> _allAlarmsObservable = BehaviorSubject();
  // Stream<List<Alarm>> get getAllAlarmsObservable => _allAlarmsObservable.stream;

  void dispose() {
    // _allAlarmsObservable.close();
  }

  void fetchAllAlarms(BuildContext context) {
    List<dynamic> hiveData = HiveUtil.getValue(HiveUtilKeys.ALARMS);
    if (hiveData == null) {
      hiveData = [];
    }

    final List<Alarm> allAlarms = hiveData.map((data) {
      final json = new Map<String, dynamic>.from(data);
      return Alarm.fromJson(json);
    }).toList();

    Provider.of<AlarmProvider>(context, listen: false).updateAllAlarms(allAlarms);
    // _allAlarmsObservable.add(allAlarms);
  }
}