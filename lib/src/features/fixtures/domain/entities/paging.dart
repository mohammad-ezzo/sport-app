import 'package:json_annotation/json_annotation.dart';
part 'paging.g.dart';

@JsonSerializable()
class Paging {
  final int? current;
  final int? total;

  Paging({this.current, this.total});

  static List<Paging> fromJsonList(List json) {
    return json.map((e) => Paging.fromJson(e)).toList();
  }

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);
  Map<String, dynamic> toJson() => _$PagingToJson(this);
}
