import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nyt_news/pages/article.dart';
import 'package:nyt_news/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                  navTitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  navActionTextStyle: TextStyle(color: Colors.black)),
              primaryColor: Colors.white,
              barBackgroundColor: Colors.white,
            ),
            home: Home(),
            routes: {
              '/home': (context) => Home(),
              ArticleDetails.routeName: (context) => ArticleDetails()
            },
          )
        : MaterialApp(
            initialRoute: '/home',
            routes: {
              '/home': (context) => Home(),
              ArticleDetails.routeName: (context) => ArticleDetails()
            },
          );
  }
}
