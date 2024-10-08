import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/core/utils/string_manager.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/explore_tab.dart';
import 'package:football_app/presentation/layouts/home/tabs/home_tab/home_tab.dart';
import 'package:football_app/presentation/layouts/home/tabs/profile_tab/profile_tab.dart';
import 'package:football_app/presentation/layouts/home/tabs/standings_tab/standings_tab.dart';
import 'package:football_app/presentation/layouts/home/view_model/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const HomeTab(),
      const ExploreTab(),
      const StandingsTab(),
      const ProfileTab()
    ];
    return BlocBuilder<HomeCubit, HomeState>(
      // buildWhen: (previous, current) {
      //   if (current is ChangeCurrentIndexState) {
      //     return true;
      //   }
      //   return false;
      // },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: FlashyTabBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            showElevation: true,
            selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            animationDuration: const Duration(milliseconds: 300),
            items: [
              FlashyTabBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.assetsIconsHome,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  title: Text(StringManager.homeTap,
                      style: Theme.of(context).textTheme.titleSmall)),
              FlashyTabBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.assetsIconsDiscovery,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  title: Text(StringManager.exploreTap,
                      style: Theme.of(context).textTheme.titleSmall)),
              FlashyTabBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.assetsIconsChart,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  title: Text(StringManager.standingseTap,
                      style: Theme.of(context).textTheme.titleSmall)),
              FlashyTabBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.assetsIconsProfile,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  title: Text(StringManager.myProfileTap,
                      style: Theme.of(context).textTheme.titleSmall)),
            ],
            onItemSelected: (value) {
              BlocProvider.of<HomeCubit>(context)
                  .changeCurrentIndex(newIndex: value);
            },
          ),
          body: tabs[HomeCubit.get(context).currentIndex],
        );
      },
    );
  }
}
