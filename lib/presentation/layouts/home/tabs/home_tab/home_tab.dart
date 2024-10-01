import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/core/constants.dart';
import 'package:football_app/core/reusable_commponants/custom_appbar.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/view_model/cubit/football_news_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/home_tab/view_model/live_match_cubit/live_matches_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/home_tab/widgets/Matches_listview_separated.dart';
import 'package:football_app/core/utils/string_manager.dart';
import 'package:football_app/presentation/layouts/home/tabs/home_tab/widgets/matches_by_league_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FootballNewsCubit>().getFotballNews();
      context.read<LiveMatchesCubit>().getAllLiveMatches();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar.customAppbar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              BlocBuilder<FootballNewsCubit, FootballNewsState>(
                builder: (context, state) {
                  if (state is FootballNewsSuccessState) {
                    return CarouselSlider(
                      items: context.read<FootballNewsCubit>().carouselSlider,
                      options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          aspectRatio: 2 / 1,
                          scrollPhysics: const ClampingScrollPhysics()),
                    );
                  }

                  return const CircularProgressIndicator.adaptive();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: BlocBuilder<LiveMatchesCubit, LiveMatchesState>(
                  buildWhen: (previous, current) {
                    if (current is LiveMatchesErrorState ||
                        current is LiveMatchesLoadingState ||
                        current is LiveMatchesSuccessState) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (state is LiveMatchesErrorState) {
                      return Center(child: Text(state.error));
                    }
                    if (state is LiveMatchesSuccessState) {
                      log('Number of matches: ${state.liveMatchesResponse.length}');
                      return state.liveMatchesResponse.isNotEmpty
                          ? RefreshIndicator(
                              onRefresh: () async {
                                await context
                                    .read<LiveMatchesCubit>()
                                    .refreshLiveMatches();
                              },
                              child: MatchesByLeagueWidget(
                                  matches: state.liveMatchesResponse))
                          : Center(
                              child: Text(
                              StringManager.foundLiveMatches,
                              style: Theme.of(context).textTheme.titleLarge,
                            ));
                    }
                    log("الووووووو");
                    return Skeletonizer(
                        containersColor:
                            Theme.of(context).colorScheme.onTertiary,
                        effect: const ShimmerEffect(),
                        enabled: true,
                        child: MatchesListviewSeparated(
                            list: Constants.getDummymatchWidget));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
