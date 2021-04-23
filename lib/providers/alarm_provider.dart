import 'package:flutter/cupertino.dart';
import 'package:onboarding_clock_challenge/models/alarm.dart';

class AlarmProvider with ChangeNotifier {
  List<Alarm> alarms = [];

  updateAllAlarms(List<Alarm> alarms) {
    if (alarms != null) {
      this.alarms = alarms;
      
      notifyListeners();
    }
  }
}