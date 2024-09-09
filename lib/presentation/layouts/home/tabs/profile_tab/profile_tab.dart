import 'package:flutter/material.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/presentation/layouts/home/tabs/profile_tab/widgets/custom_list_tile.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image.asset(AssetsManager.assetsNotFoundImage),
        ),
        Text(
          "#liverbool YNWA",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const CustomListTile(title: "Name", subTitle: "dadad"),
        const CustomListTile(title: "Email", subTitle: "dadad"),
        const CustomListTile(title: "Favourite Team", subTitle: "Liverbool"),
      ],
    );
  }
}
