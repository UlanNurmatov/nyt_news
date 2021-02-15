// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['section'] as String,
    json['subsection'] as String,
    json['title'] as String,
    json['abstract'] as String,
    json['url'] as String,
    json['byline'] as String,
    json['item_type'] as String,
    json['updated_date'] as String,
    json['created_date'] as String,
    json['published_date'] as String,
    (json['geo_facet'] as List)?.map((e) => e as String)?.toList(),
    (json['multimedia'] as List)
        ?.map((e) =>
            e == null ? null : Multimedia.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'section': instance.section,
      'subsection': instance.subsection,
      'title': instance.title,
      'abstract': instance.abstract,
      'url': instance.url,
      'byline': instance.byline,
      'item_type': instance.item_type,
      'updated_date': instance.updated_date,
      'created_date': instance.created_date,
      'published_date': instance.published_date,
      'geo_facet': instance.geo_facet,
      'multimedia': instance.multimedia?.map((e) => e?.toJson())?.toList(),
    };
