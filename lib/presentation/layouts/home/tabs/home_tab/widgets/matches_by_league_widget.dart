import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'match_widget.dart'; // الويدجت الخاص بعرض المباراة

class MatchesByLeagueWidget extends StatelessWidget {
  final List<FootballResponse> matches;

  const MatchesByLeagueWidget({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    // تصنيف المباريات حسب الدوري
    Map<String, List<FootballResponse>> matchesByLeague = {};
    for (var match in matches) {
      String leagueName = match.league?.name ?? "invalid league";
      if (!matchesByLeague.containsKey(leagueName)) {
        matchesByLeague[leagueName] = [];
      }
      matchesByLeague[leagueName]!.add(match);
    }
    return ListView(
      children: matchesByLeague.entries.map((entry) {
        String leagueName = entry.key;
        List<FootballResponse> leagueMatches = entry.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: leagueMatches[0].league?.logo ?? "",
                  width: 30,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/not_found.png'),
                ),
                const SizedBox(width: 10),
                Text(
                  leagueName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: leagueMatches.map((match) {
                return MatchWidget(match: match); // عرض ويدجت المباراة
              }).toList(),
            ),
            const Divider(), // خط فاصل بين الدوريات
          ],
        );
      }).toList(),
    );
  }
}
