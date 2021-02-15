import 'package:flutter/material.dart';
import 'package:nyt_news/models/results.dart';
import 'article_item.dart';

class HomepageScrollView extends StatelessWidget {
  final Results result;

  HomepageScrollView(this.result);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.fromLTRB(16.0, 19.0, 16.0, 8.0),
            child: Text('HOME')),
      ),
      SliverPadding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final article = result.results[index];
            return ArticleItem(article: article, index: index);
          }, childCount: result.results.length),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Text(
              result.copyright,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            )),
      ),
    ]);
  }
}
