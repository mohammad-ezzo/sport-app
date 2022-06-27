import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/player.dart';
part 'starxi.g.dart';

@JsonSerializable()
class StartXI {
  Player? player;

  StartXI({this.player});
  static List<StartXI> fromJsonList(List json) {
    return json.map((e) => StartXI.fromJson(e)).toList();
  }

  factory StartXI.fromJson(Map<String, dynamic> json) =>
      _$StartXIFromJson(json);
  Map<String, dynamic> toJson() => _$StartXIToJson(this);
}
