import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/score.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/teams.dart';

import 'goals.dart';
import 'league.dart';
import 'periods.dart';
import 'status.dart';
import 'venue.dart';
part 'fixture.g.dart';

@JsonSerializable()
class Fixture {
  @JsonKey(name: "fixture")
  final FixtureInfo? info;
  final League? league;
  final Teams? teams;
  final Goals? goals;
  final Score? score;

  Fixture({this.info, this.league, this.teams, this.goals, this.score});

  static List<Fixture> fromJsonList(List json) {
    return json.map((e) => Fixture.fromJson(e)).toList();
  }

  factory Fixture.fromJson(Map<String, dynamic> json) =>
      _$FixtureFromJson(json);
  Map<String, dynamic> toJson() => _$FixtureToJson(this);
}

@JsonSerializable()
class FixtureInfo {
  final int? id;
  final String? timezone;
  final String? date;
  final int? timestamp;
  final Periods? periods;
  final Venue? venue;
  final Status? status;

  FixtureInfo(
      {this.id,
      this.timezone,
      this.date,
      this.timestamp,
      this.periods,
      this.venue,
      this.status});

  static List<FixtureInfo> fromJsonList(List json) {
    return json.map((e) => FixtureInfo.fromJson(e)).toList();
  }

  factory FixtureInfo.fromJson(Map<String, dynamic> json) =>
      _$FixtureInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FixtureInfoToJson(this);
}
