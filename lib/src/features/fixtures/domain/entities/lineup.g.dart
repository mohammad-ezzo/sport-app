// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lineup _$LineupFromJson(Map<String, dynamic> json) => Lineup(
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      formation: json['formation'] as String?,
      startXI: (json['startXI'] as List<dynamic>?)
          ?.map((e) => StartXI.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LineupToJson(Lineup instance) => <String, dynamic>{
      'team': instance.team,
      'formation': instance.formation,
      'startXI': instance.startXI,
    };
