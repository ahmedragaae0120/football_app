import 'package:flutter/material.dart';
import 'package:football_app/core/utils/app_colors.dart';
import 'package:football_app/core/utils/texts_styles.dart';

class ThemeManager {
  static ThemeData? darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff181829),
    appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white, backgroundColor: Colors.transparent),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff2B2B3D),
      primary: AppColorsDark.primaryColor,
      onPrimary: AppColorsDark.onPrimaryColor,
      secondary: AppColorsDark.secondaryColor,
      onSecondary: AppColorsDark.onSecondaryColor,
      tertiary: AppColorsDark.bottomNavigationBackgroundColor,
      onTertiary: AppColorsDark.iconBottomNavigationColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      titleSmall: TextsStyles.tabsTitleStyles,
      titleLarge: TextsStyles.titleAppStyle,
      headlineSmall: TextsStyles.descriptionsStyle,
    ),
  );
}
