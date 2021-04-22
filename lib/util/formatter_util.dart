import 'package:flutter/material.dart';

class FormatterUtil {
  FormatterUtil._() {}

  static String timeOfDayToString(TimeOfDay timeOfDay) {
    final String hour = '${timeOfDay.hour}'.padLeft(2, '0');
    final String minute = '${timeOfDay.minute}'.padLeft(2, '0');

    return '$hour : $minute';
  }

  static String hourMinuteString({@required int hour, @required int minute}) {
    final String hourString = '$hour'.padLeft(2, '0');
    final String minuteString = '$minute'.padLeft(2, '0');

    return '$hourString : $minuteString';
  }
}