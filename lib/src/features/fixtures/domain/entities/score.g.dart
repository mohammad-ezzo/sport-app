// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
      halftime: json['halftime'] == null
          ? null
          : Goals.fromJson(json['halftime'] as Map<String, dynamic>),
      fulltime: json['fulltime'] == null
          ? null
          : Fulltime.fromJson(json['fulltime'] as Map<String, dynamic>),
      extratime: json['extratime'] == null
          ? null
          : Fulltime.fromJson(json['extratime'] as Map<String, dynamic>),
      penalty: json['penalty'] == null
          ? null
          : Fulltime.fromJson(json['penalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'halftime': instance.halftime,
      'fulltime': instance.fulltime,
      'extratime': instance.extratime,
      'penalty': instance.penalty,
    };
