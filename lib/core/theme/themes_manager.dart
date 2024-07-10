import 'package:flutter/material.dart';
import 'package:rahaf/core/theme/app_colors.dart';

abstract class ThemesManager {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      primaryColor: AppColors.blueColor,
      primaryColorLight: AppColors.mediumBlueColor,
      fontFamily: 'Item',
      scaffoldBackgroundColor: AppColors.whiteColor,
      dividerColor: AppColors.blackColor,
            cardColor: AppColors.greyColor,

      textTheme: const TextTheme(
        bodyLarge: TextStyle(color:AppColors.blackColor),
        bodyMedium: TextStyle(color:AppColors.blueColor),
        bodySmall: TextStyle(color: AppColors.greyColor),
        displayLarge: TextStyle(color: AppColors.whiteColor),
        displayMedium: TextStyle(color:AppColors.darkBlueColor ),
        displaySmall: TextStyle(color: AppColors.redColor)
        
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        surfaceContainer: AppColors.whiteColor,
        surfaceContainerHigh: AppColors.lightGreyColor,
        surfaceContainerHighest: AppColors.lightGreyColor,
        secondaryContainer: AppColors.redColor,
));
}
