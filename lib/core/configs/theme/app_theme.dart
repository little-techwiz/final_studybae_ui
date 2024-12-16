
import 'package:flutter/material.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';

ThemeData lightTheme(TextTheme googleTextTheme) {

  return ThemeData(
    useMaterial3: false,
    textTheme: googleTextTheme.copyWith(
      titleLarge: googleTextTheme.titleLarge!.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorBlack,
          height: 1.3),
      titleMedium: googleTextTheme.titleMedium!.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorBlack,
          height: 1.3),
      titleSmall: googleTextTheme.titleSmall!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorBlack,
          height: 1.3),
      labelLarge: googleTextTheme.labelLarge!
          .copyWith(fontSize: 30, color: AppColors.textColorWhite, height: 1.3),
      labelMedium: googleTextTheme.labelMedium!
          .copyWith(fontSize: 12, color: AppColors.textColorWhite, height: 1.3),
      labelSmall: googleTextTheme.labelSmall!
          .copyWith(fontSize: 10, color: AppColors.textColorWhite, height: 1.3),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF25D366),
      textTheme: ButtonTextTheme.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
        selectionColor: AppColors.primaryColor,
        selectionHandleColor: AppColors.primaryColor
    ),
    // primarySwatch: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scafoldColorLight,
    primaryColor: AppColors.primaryColor,
  );
}

ThemeData darkTheme(TextTheme googleTextTheme) {
  return ThemeData(
    useMaterial3: false,
    textTheme: googleTextTheme.copyWith(
      titleLarge: googleTextTheme.titleLarge!.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorWhite,
          height: 1.3),
      titleMedium: googleTextTheme.titleMedium!.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorWhite,
          height: 1.3),
      titleSmall: googleTextTheme.titleSmall!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorWhite,
          height: 1.3),
      labelLarge: googleTextTheme.labelLarge!
          .copyWith(fontSize: 30, color: AppColors.textColorWhite, height: 1.3),
      labelMedium: googleTextTheme.labelMedium!
          .copyWith(fontSize: 12, color: AppColors.textColorWhite, height: 1.3),
      labelSmall: googleTextTheme.labelSmall!
          .copyWith(fontSize: 10, color: AppColors.textColorWhite, height: 1.3),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF25D366),
      textTheme: ButtonTextTheme.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
        selectionColor: AppColors.primaryColor,
        selectionHandleColor: AppColors.primaryColor
    ),
    // primarySwatch: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scafoldColorDark,
    primaryColor: AppColors.primaryColorDark,
  );
}
