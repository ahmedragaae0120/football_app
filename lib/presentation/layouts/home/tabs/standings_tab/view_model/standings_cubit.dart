import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:football_app/data/datasource_contract/remote/Standings_datasource_contract.dart';
import 'package:football_app/data/models/standings_model/standings/response.dart';
import 'package:injectable/injectable.dart';

part 'standings_state.dart';

@injectable
class StandingsCubit extends Cubit<StandingsState> {
  @factoryMethod
  StandingsCubit(this.standingsDatasource) : super(StandingsInitial());
  StandingsDatasourceContract standingsDatasource;

  getStandings() async {
    emit(StandingsLoadingState());
    List<Future<Either<List<StandingsResponse>?, String>>> result = [
      standingsDatasource.getStandings(leagueId: 39),
      standingsDatasource.getStandings(leagueId: 140),
      standingsDatasource.getStandings(leagueId: 78),
      standingsDatasource.getStandings(leagueId: 61),
      standingsDatasource.getStandings(leagueId: 135),
    ];
    List<Either<List<StandingsResponse>?, String>> responses =
        await Future.wait(result);
    List<StandingsResponse>? prOfStandings;
    List<StandingsResponse>? laLigaOfStandings;
    List<StandingsResponse>? bundesligaOfStandings;
    List<StandingsResponse>? ligue1OfStandings;
    List<StandingsResponse>? serieAOfStandings;

    for (int i = 0; i < responses.length; i++) {
      responses[i].fold(
        (standings) {
          switch (i) {
            case 0: // Premier League
              prOfStandings = standings;
              break;
            case 1: // La Liga
              laLigaOfStandings = standings;
              break;
            case 2: // Bundesliga
              bundesligaOfStandings = standings;
              break;
            case 3: // Ligue 1
              ligue1OfStandings = standings;
              break;
            case 4: // Serie A
              serieAOfStandings = standings;
              break;
            default:
              break;
          }
        },
        (error) {
          log("error State: $error ");
          emit(StandingsErrorState(error));
        },
      );
    }
    emit(StandingsSuccessState(
      prOfStandings: prOfStandings,
      laLigaOfStandings: laLigaOfStandings,
      bundesligaOfStandings: bundesligaOfStandings,
      ligue1OfStandings: ligue1OfStandings,
      serieAOfStandings: serieAOfStandings,
    ));
  }

  getStandingsPremierLeague() async {
    emit(StandingsLoadingState());
    var result = await standingsDatasource.getStandings(leagueId: 39);
    return result.fold(
      (standings) {
        emit(PrStandingsSuccessState(prOfStandings: standings));
      },
      (error) {
        emit(StandingsErrorState(error));
      },
    );
  }

  getStandingsLaLiga() async {
    emit(StandingsLoadingState());
    var result = await standingsDatasource.getStandings(leagueId: 140);
    return result.fold(
      (standings) {
        emit(LaLigaStandingsSuccessState(laLigaOfStandings: standings));
      },
      (error) {
        emit(StandingsErrorState(error));
      },
    );
  }

  getStandingsBundesliga() async {
    emit(StandingsLoadingState());
    var result = await standingsDatasource.getStandings(leagueId: 78);
    return result.fold(
      (standings) {
        emit(BundesligaStandingsSuccessState(bundesligaOfStandings: standings));
      },
      (error) {
        emit(StandingsErrorState(error));
      },
    );
  }

  getStandingsLigue1() async {
    emit(StandingsLoadingState());
    var result = await standingsDatasource.getStandings(leagueId: 61);
    return result.fold(
      (standings) {
        emit(Ligue1StandingsSuccessState(ligue1OfStandings: standings));
      },
      (error) {
        emit(StandingsErrorState(error));
      },
    );
  }

  getStandingsSerieA() async {
    emit(StandingsLoadingState());
    var result = await standingsDatasource.getStandings(leagueId: 135);
    return result.fold(
      (standings) {
        emit(SerieAStandingsSuccessState(serieAOfStandings: standings));
      },
      (error) {
        emit(StandingsErrorState(error));
      },
    );
  }
}
