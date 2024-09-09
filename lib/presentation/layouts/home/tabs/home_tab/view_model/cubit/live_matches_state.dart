part of 'live_matches_cubit.dart';

abstract class LiveMatchesState {}

final class LiveMatchesInitial extends LiveMatchesState {}

final class LiveMatchesSuccessState extends LiveMatchesState {
  List<Response> liveMatchesResponse;
  LiveMatchesSuccessState(this.liveMatchesResponse);
}

final class LiveMatchesErrorState extends LiveMatchesState {
  String error;
  LiveMatchesErrorState(this.error);
}

final class LiveMatchesLoadingState extends LiveMatchesState {}
