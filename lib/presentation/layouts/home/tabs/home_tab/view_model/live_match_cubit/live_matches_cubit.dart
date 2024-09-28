import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:football_app/data/datasource_contract/remote/liveMatches_datasource_contract.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:injectable/injectable.dart';

part 'live_matches_state.dart';

@injectable
class LiveMatchesCubit extends Cubit<LiveMatchesState> {
  @factoryMethod
  LiveMatchesCubit(
    this.liveMatchesDatasourceContract,
  ) : super(LiveMatchesInitial());

  LiveMatchesDatasourceContract liveMatchesDatasourceContract;

  List<FootballResponse> cachedLiveMatches = [];
  getAllLiveMatches() async {
    if (cachedLiveMatches.isNotEmpty) {
      emit(LiveMatchesSuccessState(cachedLiveMatches));
      return;
    }
    emit(LiveMatchesLoadingState());
    var result = await liveMatchesDatasourceContract.getAllLivematches();
    return result.fold(
      (liveMatchesResponse) {
        cachedLiveMatches = liveMatchesResponse;
        emit(LiveMatchesSuccessState(liveMatchesResponse));
      },
      (error) {
        log("LiveMatchesErrorState");
        emit(LiveMatchesErrorState(error));
      },
    );
  }

  refreshLiveMatches() async {
    cachedLiveMatches.clear();
    await getAllLiveMatches();
  }
}
