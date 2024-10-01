part of 'football_news_cubit.dart';

abstract class FootballNewsState {}

final class FootballNewsInitial extends FootballNewsState {}

final class FootballNewsSuccessState extends FootballNewsState {
  List<Articles> listOfArticles;
  FootballNewsSuccessState(this.listOfArticles);
}

final class FootballNewsErrorState extends FootballNewsState {
  String error;
  FootballNewsErrorState(this.error);
}

final class FootballNewsLoadingState extends FootballNewsState {}


final class SearchNewsSuccessState extends FootballNewsState {
  List<Articles> listOfArticles;
  SearchNewsSuccessState(this.listOfArticles);
}

final class SearchNewsErrorState extends FootballNewsState {
  String error;
  SearchNewsErrorState(this.error);
}

final class SearchNewsLoadingState extends FootballNewsState {}
