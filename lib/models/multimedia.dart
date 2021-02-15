import 'package:json_annotation/json_annotation.dart';
part 'multimedia.g.dart';

@JsonSerializable()
class Multimedia {
  String url;
  String caption;
  String copyright;

  Multimedia(this.url, this.caption, this.copyright);

  factory Multimedia.fromJson(Map<String, dynamic> json) =>
      _$MultimediaFromJson(json);

  Map<String, dynamic> toJson() => _$MultimediaToJson(this);
}
