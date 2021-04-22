// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return Alarm(
    hour: json['hour'] as int,
    minute: json['minute'] as int,
    isActive: json['isActive'] as bool,
  );
}

Map<String, dynamic> _$AlarmToJson(Alarm instance) => <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'isActive': instance.isActive,
    };
