import 'package:json_annotation/json_annotation.dart';
part 'team.g.dart';

@JsonSerializable()
class Team {
  final int? id;
  final String? name;
  final String? logo;
  final bool? winner;

  Team({this.id, this.name, this.logo, this.winner});

  static List<Team> fromJsonList(List json) {
    return json.map((e) => Team.fromJson(e)).toList();
  }

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
