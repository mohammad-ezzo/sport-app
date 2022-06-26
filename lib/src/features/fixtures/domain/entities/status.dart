import 'package:json_annotation/json_annotation.dart';
part 'status.g.dart';

@JsonSerializable()
class Status {
  final String? long;
  final String? short;
  final int? elapsed;

  Status({this.long, this.short, this.elapsed});

  static List<Status> fromJsonList(List json) {
    return json.map((e) => Status.fromJson(e)).toList();
  }

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
