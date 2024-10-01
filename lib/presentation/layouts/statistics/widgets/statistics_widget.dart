import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:football_app/data/models/statisticsmatch_model/statisticsmatchresponse/response.dart';
import 'package:football_app/presentation/layouts/statistics/widgets/events_Builder.dart';
import 'package:football_app/presentation/layouts/statistics/widgets/statistics_row_custom.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StatisticsWidget extends StatelessWidget {
  final FootballResponse match;
  final List<Response> statisticsList;
  const StatisticsWidget(
      {super.key, required this.match, required this.statisticsList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary, // لون الحدود (stroke)
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        child: CachedNetworkImage(
                          imageUrl: match.teams?.home?.logo ?? "",
                          fit: BoxFit.contain,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Skeletonizer(
                            enabled: true,
                            child: Container(
                              color: Colors.grey,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset(AssetsManager.assetsNotFoundImage),
                        ),
                      ),
                    ),
                    Text(
                      statisticsList[0].team.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${match.goals?.home} - ${match.goals?.away}",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 40),
                    ),
                    Text(
                      match.fixture?.status?.elapsed.toString() ?? "0",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary, // لون الحدود (stroke)
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        child: CachedNetworkImage(
                          imageUrl: match.teams?.away?.logo ?? "",
                          fit: BoxFit.contain,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Skeletonizer(
                            enabled: true,
                            child: Container(
                              color: Colors.grey,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset(AssetsManager.assetsNotFoundImage),
                        ),
                      ),
                    ),
                    Text(
                      statisticsList[1].team.name,
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            EventsBuilder(
              events: match.events,
              match: match,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Statistics Match: ",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
            const SizedBox(
              height: 10,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[2].value,
              statisticsName: statisticsList[0].statistics[2].type,
              away: statisticsList[1].statistics[2].value,
            ),
            const SizedBox(
              height: 20,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[1].value,
              statisticsName: statisticsList[0].statistics[1].type,
              away: statisticsList[1].statistics[1].value,
            ),
            const SizedBox(
              height: 20,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[16].value,
              statisticsName: statisticsList[0].statistics[16].type,
              away: statisticsList[1].statistics[16].value,
            ),
            const SizedBox(
              height: 20,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[9].value,
              statisticsName: statisticsList[0].statistics[9].type,
              away: statisticsList[1].statistics[9].value,
            ),
            const SizedBox(
              height: 20,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[8].value,
              statisticsName: statisticsList[0].statistics[8].type,
              away: statisticsList[1].statistics[8].value,
            ),
            const SizedBox(
              height: 20,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[10].value,
              statisticsName: statisticsList[0].statistics[10].type,
              away: statisticsList[1].statistics[10].value,
            ),
            const SizedBox(
              height: 20,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[13].value,
              statisticsName: statisticsList[0].statistics[13].type,
              away: statisticsList[1].statistics[13].value,
            ),
            const SizedBox(
              height: 20,
            ),
            StatisticsRowCustom(
              home: statisticsList[0].statistics[15].value,
              statisticsName: statisticsList[0].statistics[15].type,
              away: statisticsList[1].statistics[15].value,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
