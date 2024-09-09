import 'package:flutter/material.dart';
import 'package:football_app/presentation/layouts/home/tabs/home_tab/widgets/match_widget.dart';

class MatchesListviewSeparated extends StatelessWidget {
  final List list;
  const MatchesListviewSeparated({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => MatchWidget(
        match: list[index],
      ),
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
