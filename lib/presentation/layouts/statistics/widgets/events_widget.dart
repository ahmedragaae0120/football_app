import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/fottball_model/Events.dart';

class EventsWidget extends StatelessWidget {
  final Events event;
  final bool isGoalForAway;
  const EventsWidget(
      {super.key, required this.event, required this.isGoalForAway});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isGoalForAway ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isGoalForAway ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetsManager.assetIconssoccerballvariant,
              color: Colors.white,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              "${event.time?.elapsed.toString() ?? ""} -",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              event.player?.name ?? "",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              event.player?.name ?? "",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        if (event.assist?.name != null)
          Text(
            "assist: ${event.assist?.name ?? ""}",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
      ],
    );
  }
}
