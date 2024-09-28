import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:football_app/presentation/layouts/statistics/view_Model/statistics_match_cubit/statisticsmatch_cubit.dart';
import 'package:football_app/presentation/layouts/statistics/widgets/statistics_widget.dart';
import 'package:lottie/lottie.dart';

class StatisticsView extends StatefulWidget {
  static const String routeName = "/StatisticsView";
  final int fixtureId;
  final FootballResponse match;
  const StatisticsView(
      {super.key, required this.fixtureId, required this.match});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<StatisticsmatchCubit>()
          .getStatisticsMatch(fixtureId: widget.fixtureId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StatisticsmatchCubit, StatisticsmatchState>(
        builder: (context, state) {
          if (state is StatisticsmatchSuccessState) {
            log(state.liveMatchesResponse.toString());
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(widget.match.league?.name ?? ''),
                centerTitle: true,
              ),
              body: StatisticsWidget(
                  match: widget.match,
                  statisticsList: state.liveMatchesResponse),
            );
          }
          if (state is StatisticsmatchErrorState) {
            return Center(
              child: Text(
                state.error,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }
          return Center(
              child: Lottie.asset(AssetsManager.assetIconsAnimationStadium));
        },
      ),
    );
  }
}
