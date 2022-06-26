// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseReponse<T> _$BaseReponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseReponse<T>(
      get: json['get'] as String?,
      response: fromJsonT(json['response']),
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      results: json['results'] as int?,
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseReponseToJson<T>(
  BaseReponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': toJsonT(instance.response),
    };
