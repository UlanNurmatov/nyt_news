part of 'homepagenews_bloc.dart';

abstract class HomepagenewsEvent {
  const HomepagenewsEvent();
}

class FetchNews extends HomepagenewsEvent {
  FetchNews();
}

class ArticleTapped extends HomepagenewsEvent {
  final int index;
  ArticleTapped(this.index);
}
