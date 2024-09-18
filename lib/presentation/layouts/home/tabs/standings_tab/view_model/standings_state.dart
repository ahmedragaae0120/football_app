part of 'standings_cubit.dart';

abstract class StandingsState {}

final class StandingsInitial extends StandingsState {}

final class StandingsErrorState extends StandingsState {
  String error;
  StandingsErrorState(this.error);
}

final class PrStandingsSuccessState extends StandingsState {
  List<StandingsResponse>? prOfStandings;

  PrStandingsSuccessState({
    this.prOfStandings,
  });
}

final class LaLigaStandingsSuccessState extends StandingsState {
  List<StandingsResponse>? laLigaOfStandings;
  LaLigaStandingsSuccessState({
    this.laLigaOfStandings,
  });
}

final class BundesligaStandingsSuccessState extends StandingsState {
  List<StandingsResponse>? bundesligaOfStandings;
  BundesligaStandingsSuccessState({
    this.bundesligaOfStandings,
  });
}

final class Ligue1StandingsSuccessState extends StandingsState {
  List<StandingsResponse>? ligue1OfStandings;
  Ligue1StandingsSuccessState({
    this.ligue1OfStandings,
  });
}

final class StandingsSuccessState extends StandingsState {
  List<StandingsResponse>? prOfStandings;
  List<StandingsResponse>? laLigaOfStandings;
  List<StandingsResponse>? bundesligaOfStandings;
  List<StandingsResponse>? ligue1OfStandings;
  List<StandingsResponse>? serieAOfStandings;
  StandingsSuccessState(
      {this.prOfStandings,
      this.laLigaOfStandings,
      this.bundesligaOfStandings,
      this.ligue1OfStandings,
      this.serieAOfStandings});
}

final class SerieAStandingsSuccessState extends StandingsState {
  List<StandingsResponse>? serieAOfStandings;
  SerieAStandingsSuccessState({this.serieAOfStandings});
}

final class StandingsLoadingState extends StandingsState {}
