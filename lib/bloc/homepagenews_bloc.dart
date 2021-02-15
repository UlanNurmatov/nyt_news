import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyt_news/bloc/homepagenews_repo.dart';
import 'package:nyt_news/models/article.dart';
import 'package:nyt_news/models/results.dart';

part 'homepagenews_event.dart';
part 'homepagenews_state.dart';

class HomepagenewsBloc extends Bloc<HomepagenewsEvent, HomepagenewsState> {
  ResultsRepo repo;
  HomepagenewsBloc(this.repo) : super(HomepagenewsInitial());

  @override
  Stream<HomepagenewsState> mapEventToState(
    HomepagenewsEvent event,
  ) async* {
    if (event is FetchNews) {
      yield HomepagenewsLoading();
      try {
        Results results = await repo.getResults();
        if (results.results.isNotEmpty) {
          yield HomepagenewsLoaded(results);
        } else {
          yield HomepagenewsNotLoaded();
        }
      } catch (_) {
        yield HomepagenewsNotLoaded();
      }
    } else if (event is ArticleTapped) {
      yield HomepagenewsTapped(repo.results.results[event.index], repo.results);
    }
  }
}
