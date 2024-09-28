import 'package:flutter/material.dart';

class StatisticsRowCustom extends StatelessWidget {
  final dynamic home;
  final String statisticsName;
  final dynamic away;
  const StatisticsRowCustom(
      {super.key,
      required this.home,
      required this.statisticsName,
      required this.away});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            home.toString(),
            textAlign: TextAlign.left,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
        ),
        Expanded(
          child: Text(
            statisticsName,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
        ),
        Expanded(
          child: Text(
            away.toString(),
            textAlign: TextAlign.right,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
