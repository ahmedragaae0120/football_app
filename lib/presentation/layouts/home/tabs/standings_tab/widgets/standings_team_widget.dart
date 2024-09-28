import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/standings_model/standings/standing.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StandingsTeamWidget extends StatelessWidget {
  final Standing? standing;
  final int index;
  const StandingsTeamWidget(
      {super.key, required this.standing, required this.index});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VerticalDivider(
            color: index + 1 >= 1 && index + 1 <= 4
                ? Colors.blue
                : index + 1 == 5
                    ? Colors.orange
                    : index + 1 >= 18
                        ? Colors.red
                        : Colors.white,
            width: 10,
            thickness: 3,
          ),
          Text("${(index + 1).toString()} - ",
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14)),
          const SizedBox(
            width: 5,
          ),
          CachedNetworkImage(
            imageUrl: standing?.team?.logo ?? "",
            width: 22,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Skeletonizer(
              enabled: true,
              child: Container(
                color: Colors.grey,
                width: 18,
                height: 20,
              ),
            ),
            errorWidget: (context, url, error) =>
                Image.asset(AssetsManager.assetsNotFoundImage),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              standing?.team?.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 12),
            ),
          ),
          Table(
            columnWidths: const {
              0: FixedColumnWidth(40),
              1: FixedColumnWidth(40),
              2: FixedColumnWidth(40),
              3: FixedColumnWidth(40),
              4: FixedColumnWidth(40),
              5: FixedColumnWidth(40),
            },
            children: [
              TableRow(children: [
                Center(
                  child: Text(
                    standing?.all?.win.toString() ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    standing?.all?.draw.toString() ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    standing?.all?.lose.toString() ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    standing?.all?.goals?.against.toString() ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    standing?.goalsDiff?.toString() ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    standing?.points?.toString() ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}

// class StaticTextWidget extends StatelessWidget {
//   final String text;
//   const StaticTextWidget({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12),
//     );
//   }
// }
