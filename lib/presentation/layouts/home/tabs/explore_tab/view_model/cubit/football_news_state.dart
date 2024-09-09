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
