import 'package:json_annotation/json_annotation.dart';
part 'full_time.g.dart';

@JsonSerializable()
class Fulltime {
  final String? home;
  final String? away;

  Fulltime({this.home, this.away});

  static List<Fulltime> fromJsonList(List json) {
    return json.map((e) => Fulltime.fromJson(e)).toList();
  }

  factory Fulltime.fromJson(Map<String, dynamic> json) =>
      _$FulltimeFromJson(json);
  Map<String, dynamic> toJson() => _$FulltimeToJson(this);
}
