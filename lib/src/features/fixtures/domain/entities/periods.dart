import 'package:json_annotation/json_annotation.dart';
part 'periods.g.dart';

@JsonSerializable()
class Periods {
  final int? first;
  final int? second;

  Periods({this.first, this.second});

  static List<Periods> fromJsonList(List json) {
    return json.map((e) => Periods.fromJson(e)).toList();
  }

  factory Periods.fromJson(Map<String, dynamic> json) =>
      _$PeriodsFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodsToJson(this);
}
