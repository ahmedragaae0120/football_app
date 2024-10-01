import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/core/reusable_commponants/custom_search_delegate.dart';
import 'package:football_app/core/utils/assets_manager.dart';
import 'package:football_app/core/utils/string_manager.dart';

class CustomAppbar {
  static PreferredSizeWidget? customAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // leading: Icon(
      //   Icons.keyboard_backspace,
      //   color: Theme.of(context).colorScheme.onPrimary,
      // ),
      title: Text(
        StringManager.titleApp,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              child: Transform.scale(
                scale: 1.2,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AssetsManager.assetsIconsSearch,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Transform.scale(
              scale: 1.2,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AssetsManager.assetsIconsNotification,
                color: Theme.of(context).colorScheme.onPrimary,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        )
      ],
    );
  }
}
