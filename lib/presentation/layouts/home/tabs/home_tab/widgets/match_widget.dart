import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:football_app/presentation/layouts/statistics/statistics_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MatchWidget extends StatefulWidget {
  final FootballResponse match;
  const MatchWidget({super.key, required this.match});

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  // Timer? timer; // المؤقت
  // int elapsedMinutes = 0; // الدقيقة التي يتم تحديثها
  // @override
  // void initState() {
  //   super.initState();
  //   elapsedMinutes = widget.match.fixture?.status?.elapsed ?? 0;
  //   timer = Timer.periodic(const Duration(minutes: 1), (timer) {
  //     setState(() {
  //       elapsedMinutes++; // زيادة الدقيقة كل دقيقة
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   timer?.cancel(); // إلغاء المؤقت عند التخلص من الويدجت
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            log(widget.match.fixture?.id.toString() ?? "");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatisticsView(
                    fixtureId: widget.match.fixture?.id ?? 0,
                    match: widget.match,
                  ),
                ));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(bottom: 8),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: CachedNetworkImage(
                        imageUrl: widget.match.teams?.home?.logo ?? "",
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
                    const SizedBox(width: 16),
                    SizedBox(
                        width: 40,
                        child: CachedNetworkImage(
                          imageUrl: widget.match.teams?.away?.logo ?? "",
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
                        )),
                  ],
                ),

                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.match.teams?.home?.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "vs",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                widget.match.teams?.away?.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.match.goals?.home ?? ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "-",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${widget.match.goals?.away ?? ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        Text(
                          " minute: ${widget.match.fixture?.status?.elapsed ?? 0}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                // const Spacer(),
                Container(
                  height: double.infinity,
                  width: 40,
                  color: Theme.of(context).colorScheme.tertiary,
                  child: Center(
                    child: Text(
                      widget.match.fixture?.status?.long == "First Half"
                          ? "Ht"
                          : "FT",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
