import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/reusable_commponants/statistics_row_custom.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StatisticsView extends StatelessWidget {
  final Response match;
  const StatisticsView({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(match.league?.name ?? ""),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  match.goals?.home.toString() ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 40),
                ),
                Text(
                  "-",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 40),
                ),
                Text(
                  match.goals?.away.toString() ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 40),
                ),
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
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    match.teams?.home?.name ?? "",
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Text(
                    match.fixture?.status?.elapsed.toString() ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Text(
                    match.teams?.away?.name ?? "",
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            const StatisticsRowCustom(
                home: 5, statisticsName: "Shooting", away: 5),
            const SizedBox(
              height: 20,
            ),
            const StatisticsRowCustom(
                home: 5, statisticsName: "Attacks", away: 5),
            const SizedBox(
              height: 20,
            ),
            const StatisticsRowCustom(
                home: 5, statisticsName: "Cards", away: 5),
            const SizedBox(
              height: 20,
            ),
            const StatisticsRowCustom(
                home: 5, statisticsName: "Corners", away: 5),
          ],
        ),
      ),
    );
  }
}
