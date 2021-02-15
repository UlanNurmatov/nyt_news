import 'package:json_annotation/json_annotation.dart';
import 'multimedia.dart';
part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article {
  String section;
  String subsection;
  String title;
  String abstract;
  String url;
  String byline;
  String item_type;
  String updated_date;
  String created_date;
  String published_date;
  List<String> geo_facet;
  List<Multimedia> multimedia;

  Article(
      this.section,
      this.subsection,
      this.title,
      this.abstract,
      this.url,
      this.byline,
      this.item_type,
      this.updated_date,
      this.created_date,
      this.published_date,
      this.geo_facet,
      this.multimedia);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
