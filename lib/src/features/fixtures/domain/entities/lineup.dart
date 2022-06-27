import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/starxi.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/team.dart';
part 'lineup.g.dart';

@JsonSerializable()
class Lineup {
  final Team? team;
  final String? formation;
  final List<StartXI>? startXI;

  Lineup({
    this.team,
    this.formation,
    this.startXI,
  });
  static List<Lineup> fromJsonList(Object? json) {
    if (json is List) return json.map((e) => Lineup.fromJson(e)).toList();
    return [];
  }

  factory Lineup.fromJson(Map<String, dynamic> json) => _$LineupFromJson(json);
  Map<String, dynamic> toJson() => _$LineupToJson(this);
}
