import 'package:json_annotation/json_annotation.dart';
part 'goals.g.dart';

@JsonSerializable()
class Goals {
  final int? home;
  final int? away;

  Goals({this.home, this.away});

  static List<Goals> fromJsonList(List json) {
    return json.map((e) => Goals.fromJson(e)).toList();
  }

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);
  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}
