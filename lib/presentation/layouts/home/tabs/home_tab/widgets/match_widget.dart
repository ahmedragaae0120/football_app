import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';

class MatchWidget extends StatefulWidget {
  final Response match;
  const MatchWidget({super.key, required this.match});

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  Timer? timer; // المؤقت
  int elapsedMinutes = 0; // الدقيقة التي يتم تحديثها
  @override
  void initState() {
    super.initState();
    elapsedMinutes = widget.match.fixture?.status?.elapsed ?? 0;
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        elapsedMinutes++; // زيادة الدقيقة كل دقيقة
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // إلغاء المؤقت عند التخلص من الويدجت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
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
                child: Image.network(
                  widget.match.teams?.home?.logo ?? "",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 40,
                child: Image.network(
                  widget.match.teams?.away?.logo ?? "",
                  fit: BoxFit.contain,
                ),
              ),
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
    );
  }
}
