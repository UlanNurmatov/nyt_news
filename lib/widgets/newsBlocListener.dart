import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nyt_news/bloc/homepagenews_bloc.dart';
import 'package:nyt_news/pages/article.dart';
import 'package:nyt_news/utils/articleArguments.dart';
import 'package:nyt_news/widgets/homepageScrollView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBlocListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final homepageNewsBloc = BlocProvider.of<HomepagenewsBloc>(context);
    homepageNewsBloc.add(FetchNews());
    return BlocListener<HomepagenewsBloc, HomepagenewsState>(
        listener: (context, HomepagenewsState state) {
      if (state is HomepagenewsTapped) {
        Navigator.pushNamed(context, ArticleDetails.routeName,
            arguments: ResultScreenArguments(state.article));
      }
    }, child: BlocBuilder<HomepagenewsBloc, HomepagenewsState>(
            builder: (context, state) {
      if (state is HomepagenewsInitial) {
        return Container();
      } else if (state is HomepagenewsLoading) {
        return Platform.isAndroid
            ? CircularProgressIndicator()
            : Center(child: CupertinoActivityIndicator());
      } else if (state is HomepagenewsNotLoaded) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text('NOT LOADED'),
        );
      } else if (state is HomepagenewsLoaded) {
        return HomepageScrollView(state.results);
      } else if (state is HomepagenewsTapped) {
        return HomepageScrollView(state.result);
      } else {
        return Text('Something went wrong');
      }
    }));
  }
}
