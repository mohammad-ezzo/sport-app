import 'package:json_annotation/json_annotation.dart';
part 'player.g.dart';

@JsonSerializable()
class Player {
  int? id;
  String? name;
  int? number;
  String? pos;
  String? grid;

  Player({this.id, this.name, this.number, this.pos, this.grid});
  static List<Player> fromJsonList(List json) {
    return json.map((e) => Player.fromJson(e)).toList();
  }

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
