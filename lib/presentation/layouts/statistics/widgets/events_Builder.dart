import 'package:flutter/material.dart';
import 'package:football_app/data/models/fottball_model/Events.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:football_app/presentation/layouts/statistics/widgets/events_widget.dart';

class EventsBuilder extends StatelessWidget {
  final List<Events>? events;
  final FootballResponse match;

  const EventsBuilder({super.key, required this.events, required this.match});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return events != null &&
                    events!.isNotEmpty &&
                    index < events!.length
                ? EventsWidget(
                    event: events![index],
                    isGoalForAway:
                        events?[index].team?.name == match.teams?.away?.name
                            ? true
                            : false,
                  )
                : const SizedBox();
          },
          itemCount: events!.length,
        ),
      ),
    );
  }
}
