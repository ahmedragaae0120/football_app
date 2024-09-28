import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/standings_model/standings/response.dart';
import 'package:football_app/data/models/standings_model/standings/standing.dart';
import 'package:football_app/presentation/layouts/home/tabs/standings_tab/widgets/all_standings_view.dart';
import 'package:football_app/presentation/layouts/home/tabs/standings_tab/widgets/standings_team_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StandingsWidget extends StatelessWidget {
  final StandingsResponse standing;
  const StandingsWidget({super.key, required this.standing});

  @override
  Widget build(BuildContext context) {
    List<Standing>? listOfStandings =
        standing.league?.standings?.expand((innerList) => innerList).toList() ??
            [];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AllStandingsView(standing: standing),
                    ));
              },
              child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: standing.league?.logo ?? "",
                    width: 30,
                    fit: BoxFit.contain,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Skeletonizer(
                      enabled: true,
                      child: Container(
                        color: Colors.grey,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(AssetsManager.assetsNotFoundImage),
                  ),
                  title: Text(
                    standing.league?.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),
                  ),
                  subtitle: Text(
                    standing.league?.country ?? "",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Table(
                columnWidths: const {
                  1: FixedColumnWidth(40),
                  2: FixedColumnWidth(40),
                  3: FixedColumnWidth(40),
                  4: FixedColumnWidth(40),
                  5: FixedColumnWidth(40),
                  6: FixedColumnWidth(40),
                },
                defaultVerticalAlignment:
                    TableCellVerticalAlignment.intrinsicHeight,
                children: [
                  TableRow(children: [
                    Center(
                      child: Text(
                        "Team",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    Center(
                      child: Text(
                        "W",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    Center(
                      child: Text(
                        "D",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    Center(
                      child: Text(
                        "L",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Ga",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Gd",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Pts",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            ListView.separated(
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.symmetric(vertical: 15),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => StandingsTeamWidget(
                standing: listOfStandings[index],
                index: index,
              ),
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
