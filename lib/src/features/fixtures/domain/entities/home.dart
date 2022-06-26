import 'package:json_annotation/json_annotation.dart';
part 'home.g.dart';

@JsonSerializable()
class Home {
  final int? id;
  final String? name;
  final String? logo;
  final bool? winner;

  Home({this.id, this.name, this.logo, this.winner});

  static List<Home> fromJsonList(List json) {
    return json.map((e) => Home.fromJson(e)).toList();
  }

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);
}
