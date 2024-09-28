part of 'statisticsmatch_cubit.dart';


abstract class StatisticsmatchState {}

final class StatisticsmatchInitial extends StatisticsmatchState {}

final class StatisticsmatchSuccessState extends StatisticsmatchState {
 List<Response> liveMatchesResponse;
 StatisticsmatchSuccessState(this.liveMatchesResponse);
}

final class StatisticsmatchErrorState extends StatisticsmatchState{
 String error;
  StatisticsmatchErrorState(this.error);
}

final class StatisticsmatchLoadingState extends StatisticsmatchState{}

