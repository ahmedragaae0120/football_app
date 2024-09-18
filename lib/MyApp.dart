import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/core/Di/di.dart';
import 'package:football_app/core/utils/theme.dart';
import 'package:football_app/presentation/layouts/home/home_view.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/view_model/cubit/football_news_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/home_tab/view_model/cubit/live_matches_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/standings_tab/view_model/standings_cubit.dart';
import 'package:football_app/presentation/layouts/home/view_model/cubit/home_cubit.dart';
import 'package:football_app/presentation/layouts/onboarding/onboarding_view.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<LiveMatchesCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<FootballNewsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<StandingsCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.darkTheme,
        themeMode: ThemeMode.dark,
        routes: {
          HomeView.routeName: (context) => const HomeView(),
          OnboardingView.routeName: (context) => const OnboardingView(),
        },
        initialRoute: OnboardingView.routeName,
      ),
    );
  }
}
