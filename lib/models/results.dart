import 'package:json_annotation/json_annotation.dart';
import 'article.dart';
part 'results.g.dart';

@JsonSerializable(explicitToJson: true)
class Results {
  String status;
  String copyright;
  String last_updated;
  int num_results;
  List<Article> results;

  Results(this.status, this.copyright, this.last_updated, this.num_results,
      this.results);

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
