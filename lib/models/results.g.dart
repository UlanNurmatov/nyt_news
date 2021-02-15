// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    json['status'] as String,
    json['copyright'] as String,
    json['last_updated'] as String,
    json['num_results'] as int,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Article.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'last_updated': instance.last_updated,
      'num_results': instance.num_results,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };
