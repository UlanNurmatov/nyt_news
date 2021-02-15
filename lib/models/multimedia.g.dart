// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multimedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Multimedia _$MultimediaFromJson(Map<String, dynamic> json) {
  return Multimedia(
    json['url'] as String,
    json['caption'] as String,
    json['copyright'] as String,
  );
}

Map<String, dynamic> _$MultimediaToJson(Multimedia instance) =>
    <String, dynamic>{
      'url': instance.url,
      'caption': instance.caption,
      'copyright': instance.copyright,
    };
