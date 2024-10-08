// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasource_contract/remote/liveMatches_datasource_contract.dart'
    as _i410;
import '../../data/datasource_contract/remote/newsfootball_datasource_contract.dart'
    as _i995;
import '../../data/datasource_contract/remote/search_news_datasource_contract.dart'
    as _i646;
import '../../data/datasource_contract/remote/Standings_datasource_contract.dart'
    as _i977;
import '../../data/datasource_contract/remote/statisticsmatches_datasource_contract.dart'
    as _i700;
import '../../data/datasource_impl/remote/liveMatches_datasource_impl.dart'
    as _i423;
import '../../data/datasource_impl/remote/newsfootball_datasource_impl.dart'
    as _i73;
import '../../data/datasource_impl/remote/search_news_datasource_impl.dart'
    as _i157;
import '../../data/datasource_impl/remote/standings_datasource_impl.dart'
    as _i46;
import '../../data/datasource_impl/remote/statisticsmatches_datasource_impl.dart'
    as _i793;
import '../../presentation/layouts/home/tabs/explore_tab/view_model/cubit/football_news_cubit.dart'
    as _i150;
import '../../presentation/layouts/home/tabs/home_tab/view_model/live_match_cubit/live_matches_cubit.dart'
    as _i765;
import '../../presentation/layouts/home/tabs/standings_tab/view_model/standings_cubit.dart'
    as _i795;
import '../../presentation/layouts/statistics/view_Model/statistics_match_cubit/statisticsmatch_cubit.dart'
    as _i1056;
import '../api/api_manger.dart' as _i339;
import '../firebase/auth_helper.dart' as _i323;
import '../firebase/firestore_helper.dart' as _i224;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.singleton<_i323.AuthHelper>(() => _i323.AuthHelper());
    gh.singleton<_i224.FirestoreHelper>(() => _i224.FirestoreHelper());
    gh.factory<_i977.StandingsDatasourceContract>(
        () => _i46.StandingsDatasourceImpl(gh<_i339.ApiManger>()));
    gh.factory<_i410.LiveMatchesDatasourceContract>(
        () => _i423.LivematchesDatasourceImpl(gh<_i339.ApiManger>()));
    gh.factory<_i995.NewsfootballDatasourceContract>(
        () => _i73.NewsfootballDatasourceImpl(gh<_i339.ApiManger>()));
    gh.factory<_i646.SearchNewsDatasourceContract>(
        () => _i157.SearchNewsDatasourceImpl(gh<_i339.ApiManger>()));
    gh.factory<_i700.StatisticsMatchesDatasourceContract>(
        () => _i793.StatisticsmatchesDatasourceImpl(gh<_i339.ApiManger>()));
    gh.factory<_i795.StandingsCubit>(
        () => _i795.StandingsCubit(gh<_i977.StandingsDatasourceContract>()));
    gh.factory<_i765.LiveMatchesCubit>(() =>
        _i765.LiveMatchesCubit(gh<_i410.LiveMatchesDatasourceContract>()));
    gh.factory<_i150.FootballNewsCubit>(() => _i150.FootballNewsCubit(
          gh<_i995.NewsfootballDatasourceContract>(),
          gh<_i646.SearchNewsDatasourceContract>(),
        ));
    gh.factory<_i1056.StatisticsmatchCubit>(() => _i1056.StatisticsmatchCubit(
        gh<_i700.StatisticsMatchesDatasourceContract>()));
    return this;
  }
}
