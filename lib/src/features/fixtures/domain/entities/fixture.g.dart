// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fixture _$FixtureFromJson(Map<String, dynamic> json) => Fixture(
      info: json['fixture'] == null
          ? null
          : FixtureInfo.fromJson(json['fixture'] as Map<String, dynamic>),
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      teams: json['teams'] == null
          ? null
          : Teams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: json['goals'] == null
          ? null
          : Goals.fromJson(json['goals'] as Map<String, dynamic>),
      score: json['score'] == null
          ? null
          : Score.fromJson(json['score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureToJson(Fixture instance) => <String, dynamic>{
      'fixture': instance.info?.toJson(),
      'league': instance.league?.toJson(),
      'teams': instance.teams?.toJson(),
      'goals': instance.goals?.toJson(),
      'score': instance.score?.toJson(),
    };

FixtureInfo _$FixtureInfoFromJson(Map<String, dynamic> json) => FixtureInfo(
      id: json['id'] as int?,
      timezone: json['timezone'] as String?,
      date: json['date'] as String?,
      timestamp: json['timestamp'] as int?,
      periods: json['periods'] == null
          ? null
          : Periods.fromJson(json['periods'] as Map<String, dynamic>),
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureInfoToJson(FixtureInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
      'date': instance.date,
      'timestamp': instance.timestamp,
      'periods': instance.periods?.toJson(),
      'venue': instance.venue?.toJson(),
      'status': instance.status?.toJson(),
    };
