import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/bloc/homepagenews_bloc.dart';
import 'package:nyt_news/models/article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    Key key,
    @required this.article,
    @required this.index,
  }) : super(key: key);

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final homepageNewsBloc = BlocProvider.of<HomepagenewsBloc>(context);
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(article.multimedia.isNotEmpty
                      ? article.multimedia[1].url
                      : 'https://via.placeholder.com/75'),
                ),
                Expanded(
                  child: Text(
                    article.title,
                    maxLines: 3,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )),
        onTap: () {
          homepageNewsBloc.add(ArticleTapped(index));
        });
  }
}
