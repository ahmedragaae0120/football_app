import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football_app/core/constants.dart';
import 'package:football_app/core/reusable_commponants/custom_appbar.dart';
import 'package:football_app/core/utils/string_manager.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/view_model/cubit/football_news_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/widgets/article_listview_separated.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<FootballNewsCubit>().getFotballNews();
      },
    );
    scrollController.addListener(
      () async {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          setState(() {
            isLoadingMore = true;
          });
          await context.read<FootballNewsCubit>().getMoreFootballNews();
          setState(() {
            isLoadingMore = false;
          });
        }
      },
    );
  }

  // void onScroll() {
  //   if (scrollController.position.pixels ==
  //           scrollController.position.maxScrollExtent &&
  //       !isLoadingMore) {
  //     loadMoreData();
  //   }
  // }

  // void loadMoreData() async {
  //   setState(() {
  //     isLoadingMore = true;
  //   });

  //   await context
  //       .read<FootballNewsCubit>()
  //       .getMoreFootballNews(); // تعديل هذه الدالة لجلب المزيد من الأخبار

  //   setState(() {
  //     isLoadingMore = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customAppbar(context),
      body: BlocBuilder<FootballNewsCubit, FootballNewsState>(
        builder: (context, state) {
          if (state is FootballNewsErrorState) {
            log(state.hashCode.toString());
            return Center(
                child: Text(
              state.error,
              style: Theme.of(context).textTheme.titleLarge,
            ));
          }
          if (state is FootballNewsSuccessState) {
            log('Number of article: ${state.listOfArticles.length}');
            return state.listOfArticles.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () =>
                        context.read<FootballNewsCubit>().refreshFootballNews(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Expanded(
                            child: ArticleListviewSeparated(
                              controller: scrollController,
                              list: state.listOfArticles,
                            ),
                          ),
                          if (isLoadingMore)
                            const SpinKitPulse(
                              color: Colors.white,
                              size: 50.0,
                            )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                    StringManager.foundAticle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ));
          }

          return Skeletonizer(
            containersColor:
                Theme.of(context).colorScheme.onTertiary.withOpacity(0.60),
            effect: const PulseEffect(),
            child: ArticleListviewSeparated(
                list: Constants.getDummyArticlesWidget),
          );
        },
      ),
    );
  }
}
