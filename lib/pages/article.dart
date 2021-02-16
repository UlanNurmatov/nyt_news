import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nyt_news/utils/articleArguments.dart';

class ArticleDetails extends StatelessWidget {
  static const routeName = '/articleScreen';

  String getDate(String date) {
    DateFormat dateFormat = DateFormat.yMMMd();
    final parsed = DateTime.parse(date);
    return dateFormat.format(parsed);
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    final ResultScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(args.article.item_type.toUpperCase()),
          )
        : AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Text(
              args.article.item_type.toUpperCase(),
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                args.article.geo_facet.isNotEmpty
                    ? Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      )
                    : Icon(
                        Icons.subject,
                        color: Colors.grey,
                      ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    args.article.geo_facet.isNotEmpty
                        ? args.article.geo_facet[0].toUpperCase()
                        : args.article.section.toUpperCase(),
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                args.article.subsection != '' ? Text(' - ') : Text(''),
                Expanded(
                  child: Text(args.article.subsection.toUpperCase(),
                      style: TextStyle(fontSize: 13)),
                ),
                Spacer(),
                Expanded(
                  child: Text(
                    getDate(args.article.published_date).toUpperCase(),
                    style: TextStyle(fontSize: 13.0),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            padding: EdgeInsets.only(left: 5.0),
            child: Row(
              children: [Expanded(child: Text(args.article.byline))],
            ),
          ),
          Container(
              margin: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                args.article.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: Text(
                args.article.abstract,
                style: TextStyle(fontSize: 18.0),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              width: MediaQuery.of(context).size.width - 40,
              height: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(args.article.multimedia.isNotEmpty
                          ? args.article.multimedia[4].url
                          : 'https://via.placeholder.com/190')))),
          Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: args.article.multimedia.isNotEmpty &&
                      args.article.multimedia[4].caption != ''
                  ? Text(args.article.multimedia[4].caption,
                      style: TextStyle(fontSize: 12.0))
                  : Container()),
        ]),
      ),
    );
  }
}
