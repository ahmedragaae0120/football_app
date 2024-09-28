import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/data/models/standings_model/standings/response.dart';
import 'package:football_app/presentation/layouts/home/tabs/standings_tab/view_model/standings_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/standings_tab/widgets/standings_widget.dart';
import 'package:lottie/lottie.dart';

class StandingsTab extends StatefulWidget {
  const StandingsTab({super.key});

  @override
  State<StandingsTab> createState() => _StandingsTabState();
}

class _StandingsTabState extends State<StandingsTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<StandingsCubit>().getStandings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingsCubit, StandingsState>(
      builder: (context, state) {
        if (state is StandingsSuccessState) {
          List<List<StandingsResponse>?> listSatndings = [
            state.prOfStandings,
            state.laLigaOfStandings,
            state.bundesligaOfStandings,
            state.serieAOfStandings,
            state.ligue1OfStandings,
          ];
          // تحقق من أن جميع القوائم فارغة أو null
          bool allListOfempty = listSatndings.every(
            (list) => list == null || list.isEmpty,
          );
          if (allListOfempty) {
            return Center(
                child: Text(
              maxLines: 2,
              softWrap: true,
              'No standings available \n    \t  try after 1 day ',
              style: Theme.of(context).textTheme.titleLarge,
            ));
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return StandingsWidget(standing: listSatndings[index]![0]);
            },
            itemCount: listSatndings.length,
          );
        }
        if (state is StandingsErrorState) {
          return Center(child: Text(state.error));
        }
        // if (state is LaLigaStandingsSuccessState) {
        //   log(state.laLigaOfStandings.toString());
        //   return StandingsWidget(standing: state.laLigaOfStandings![0]);
        // }
        // return Column(
        //   children: [
        //     if (state is StandingsSuccessState)
        //       Expanded(
        //           child: StandingsWidget(standing: state.prOfStandings![0])),
        //     if (state is StandingsSuccessState)
        //       Expanded(
        //           child:
        //               StandingsWidget(standing: state.laLigaOfStandings![0])),
        //     // if (state is BundesligaStandingsSuccessState)
        //     //   _buildStandingsSection('Bundesliga', state.bundesligaOfStandings),
        //     // if (state is Ligue1StandingsSuccessState)
        //     //   _buildStandingsSection('Ligue 1', state.ligue1OfStandings),
        //     // if (state is SerieAStandingsSuccessState)
        //     //   _buildStandingsSection('Serie A', state.serieAOfStandings),
        //   ],
        // );
        return Center(
          child: Lottie.asset(AssetsManager.assetIconsAnimation),
        );
      },
    );
  }
}
