import 'package:json_annotation/json_annotation.dart';
part 'venue.g.dart';

@JsonSerializable()
class Venue {
  int? id;
  String? name;
  String? city;

  Venue({this.id, this.name, this.city});

  static List<Venue> fromJsonList(List json) {
    return json.map((e) => Venue.fromJson(e)).toList();
  }

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
  Map<String, dynamic> toJson() => _$VenueToJson(this);
}
