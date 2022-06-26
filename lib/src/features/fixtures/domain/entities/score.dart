import 'package:json_annotation/json_annotation.dart';

import 'full_time.dart';
import 'goals.dart';
part 'score.g.dart';

@JsonSerializable()
class Score {
  final Goals? halftime;
  final Fulltime? fulltime;
  final Fulltime? extratime;
  final Fulltime? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  static List<Score> fromJsonList(List json) {
    return json.map((e) => Score.fromJson(e)).toList();
  }

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}
