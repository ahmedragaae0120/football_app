import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:football_app/data/datasource_contract/remote/statisticsmatches_datasource_contract.dart';
import 'package:football_app/data/models/statisticsmatch_model/statisticsmatchresponse/response.dart';
import 'package:injectable/injectable.dart';

part 'statisticsmatch_state.dart';

@injectable
class StatisticsmatchCubit extends Cubit<StatisticsmatchState> {
  @factoryMethod
  StatisticsmatchCubit(this.statisticsmatchesDatasourceContract)
      : super(StatisticsmatchInitial());

  StatisticsMatchesDatasourceContract statisticsmatchesDatasourceContract;

  getStatisticsMatch({required int fixtureId}) async {
    emit(StatisticsmatchLoadingState());
    var result = await statisticsmatchesDatasourceContract.getStatisticsMatch(
        fixtureId: fixtureId);
    return result.fold(
      (statistic) {
        emit(StatisticsmatchSuccessState(statistic));
      },
      (error) {
        log(error.toString());
        emit(StatisticsmatchErrorState(error));
      },
    );
  }
}
