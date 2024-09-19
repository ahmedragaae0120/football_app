import 'package:football_app/data/models/fottball_model/Away.dart';
import 'package:football_app/data/models/fottball_model/Fixture.dart';
import 'package:football_app/data/models/fottball_model/Fulltime.dart';
import 'package:football_app/data/models/fottball_model/Goals.dart';
import 'package:football_app/data/models/fottball_model/Response.dart';
import 'package:football_app/data/models/fottball_model/Score.dart';
import 'package:football_app/data/models/fottball_model/Teams.dart';
import 'package:football_app/data/models/news_model/Articles.dart';

class Constants {
  static const String regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String footballApiBaseUrl = "https://v3.football.api-sports.io";
  static const String newsApiBaseUrl = "https://newsapi.org";
  static const String footballapiKey = "484eeb40f50923f4c8eb964c69d3182d";
  static const String newsApiKey = "e95fceda6d274d78bade4ba56ba9191b";

  static List<Response> getDummymatchWidget = [
    Response(
      goals: Goals(away: 5, home: 2),
      fixture: Fixture(date: "6546565"),
      score: Score(fulltime: Fulltime(away: 15, home: 15)),
      teams: Teams(
        away: Away(name: "dasdada", logo: "sdadasdadasdsad"),
      ),
    ),
    Response(
      goals: Goals(away: 5, home: 2),
      fixture: Fixture(date: "6546565"),
      score: Score(fulltime: Fulltime(away: 15, home: 15)),
      teams: Teams(
        away: Away(name: "dasdada", logo: "sdadasdadasdsad"),
      ),
    ),
    Response(
      goals: Goals(away: 5, home: 2),
      fixture: Fixture(date: "6546565"),
      score: Score(fulltime: Fulltime(away: 15, home: 15)),
      teams: Teams(
        away: Away(name: "dasdada", logo: "sdadasdadasdsad"),
      ),
    ),
    Response(
      goals: Goals(away: 5, home: 2),
      fixture: Fixture(date: "6546565"),
      score: Score(fulltime: Fulltime(away: 15, home: 15)),
      teams: Teams(
        away: Away(name: "dasdada", logo: "sdadasdadasdsad"),
      ),
    ),
  ];
  static List<Articles> getDummyArticlesWidget = [
    Articles(
        title: "dsadasdada",
        publishedAt: "646665652",
        description: "adadasdafasfafdsaadfafafadsad"),
    Articles(
        title: "dsadasdada",
        publishedAt: "646665652",
        description: "adadasdafasfafdsaadfafafadsad"),
    Articles(
        title: "dsadasdada",
        publishedAt: "646665652",
        description: "adadasdafasfafdsaadfafafadsad"),
    Articles(
        title: "dsadasdada",
        publishedAt: "646665652",
        description: "adadasdafasfafdsaadfafafadsad"),
  ];
}
