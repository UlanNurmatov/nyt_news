part of 'homepagenews_bloc.dart';

abstract class HomepagenewsState {
  const HomepagenewsState();
}

class HomepagenewsInitial extends HomepagenewsState {}

class HomepagenewsLoading extends HomepagenewsState {}

class HomepagenewsTapped extends HomepagenewsState {
  final Article article;
  final Results result;
  HomepagenewsTapped(this.article, this.result);
}

class HomepagenewsLoaded extends HomepagenewsState {
  final Results results;
  HomepagenewsLoaded(this.results);
}

class HomepagenewsNotLoaded extends HomepagenewsState {}
