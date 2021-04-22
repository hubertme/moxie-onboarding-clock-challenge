import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alarm.g.dart';

@JsonSerializable()
class Alarm extends HiveObject {
  int hour;

  int minute;

  bool isActive;

  Alarm({
    @required this.hour,
    @required this.minute,
    this.isActive = true,
  });

  // From Json consumption
  factory Alarm.fromJson(Map<String, dynamic> json) =>
      _$AlarmFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$AlarmToJson(this);
}