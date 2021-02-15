import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nyt_news/bloc/homepagenews_bloc.dart';
import 'package:nyt_news/bloc/homepagenews_repo.dart';
import 'package:nyt_news/widgets/androidAppBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_news/widgets/newsBlocListener.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String title = 'New York Times';

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title.toUpperCase()),
          )
        : AndroidAppBar(title: title);

    final pageBody = BlocProvider(
        create: (context) {
          return HomepagenewsBloc(ResultsRepo());
        },
        child: NewsBlocListener());

    return Platform.isIOS
        ? CupertinoPageScaffold(navigationBar: appBar, child: pageBody)
        : Scaffold(appBar: appBar, body: pageBody);
  }
}
