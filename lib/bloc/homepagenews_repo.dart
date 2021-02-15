import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nyt_news/models/results.dart';

//Parse http request json result into Results model

class ResultsRepo {
  Results results;
  Future<Results> getResults() async {
    final url =
        'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=knwxSP4zGZb3Zj0ulhtk2mzXhqiQE1Av';
    final result = await http.get(url);
    if (result.statusCode != 200) {
      throw Exception();
    }
    final extractedData =
        json.decode(utf8.decode(result.bodyBytes)) as Map<String, dynamic>;
    results = Results.fromJson(extractedData);
    return Results.fromJson(extractedData);
  }
}
