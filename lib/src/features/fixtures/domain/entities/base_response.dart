import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/paging.dart';
part 'base_response.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, genericArgumentFactories: true)
class BaseReponse<T> {
  final String? get;
  final Map<String, String>? parameters;
  final List<String>? errors;
  final int? results;
  final Paging? paging;
  final T? response;

  BaseReponse(
      {this.get,
      this.response,
      this.parameters,
      this.errors,
      this.results,
      this.paging});

  factory BaseReponse.fromJson(Map<String, dynamic> json, fromJsonT) =>
      _$BaseReponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(toJsonT) => _$BaseReponseToJson(this, toJsonT);
}
