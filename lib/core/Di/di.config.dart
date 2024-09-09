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
import '../../data/datasource_impl/remote/liveMatches_datasource_impl.dart'
    as _i423;
import '../../data/datasource_impl/remote/newsfootball_datasource_impl.dart'
    as _i73;
import '../../presentation/layouts/home/tabs/explore_tab/view_model/cubit/football_news_cubit.dart'
    as _i150;
import '../../presentation/layouts/home/tabs/home_tab/view_model/cubit/live_matches_cubit.dart'
    as _i242;
import '../api/api_manger.dart' as _i339;

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
    gh.factory<_i410.LiveMatchesDatasourceContract>(
        () => _i423.LivematchesDatasourceImpl(gh<_i339.ApiManger>()));
    gh.factory<_i995.NewsfootballDatasourceContract>(
        () => _i73.NewsfootballDatasourceImpl(gh<_i339.ApiManger>()));
    gh.factory<_i242.LiveMatchesCubit>(() =>
        _i242.LiveMatchesCubit(gh<_i410.LiveMatchesDatasourceContract>()));
    gh.factory<_i150.FootballNewsCubit>(() =>
        _i150.FootballNewsCubit(gh<_i995.NewsfootballDatasourceContract>()));
    return this;
  }
}
