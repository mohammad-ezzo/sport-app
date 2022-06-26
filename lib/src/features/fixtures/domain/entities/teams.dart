import 'package:json_annotation/json_annotation.dart';

import 'team.dart';
part 'teams.g.dart';

@JsonSerializable()
class Teams {
  final Team? home;
  final Team? away;

  Teams({this.home, this.away});

  static List<Teams> fromJsonList(List json) {
    return json.map((e) => Teams.fromJson(e)).toList();
  }

  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamsToJson(this);
}
