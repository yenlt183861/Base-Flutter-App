import 'package:flutter/material.dart';

import 'barrel_resources.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      inputDecorationTheme: _AppInputDecorationTheme.lightTheme,
      appBarTheme: _AppBarTheme.lightTheme,
      dialogBackgroundColor: AppColor.white,
      colorScheme: _AppColorScheme.lightColorScheme,
      textTheme: _AppTextTheme.lightTextTheme,
      buttonTheme: _AppButtonStyleTheme.lightTheme,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColor.scienceBlue),
          disabledForegroundColor: Colors.grey,
          foregroundColor: AppColor.scienceBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: AppFont.medium(color: Colors.white),
        ),
      ));
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    inputDecorationTheme: _AppInputDecorationTheme.darkTheme,
    dialogTheme: DialogTheme(backgroundColor: AppColor.white),
    textTheme: _AppTextTheme.dartTextTheme,
    colorScheme: _AppColorScheme.darkColorScheme,
    appBarTheme: _AppBarTheme.darkTheme,
  );
}

class _AppTextTheme {
  static TextTheme get lightTextTheme => TextTheme(
        bodyLarge: AppFont.regular(fontSize: 18, color: Colors.white),
        bodyMedium: AppFont.regular(color: Colors.white),
        bodySmall: AppFont.regular(fontSize: 14, color: Colors.white),
        // displaySmall: AppFont.regular(fontSize: 14, color: Colors.white),
        // widgets: Text
        labelMedium: AppFont.regular(color: Colors.white),
      );

  static TextTheme get dartTextTheme => TextTheme(
        bodyLarge: AppFont.regular(fontSize: 18),
        bodyMedium: AppFont.regular(),
        bodySmall: AppFont.regular(fontSize: 14),
        labelMedium: AppFont.regular(),
      );
}

class _AppInputDecorationTheme {
  static InputDecorationTheme get lightTheme {
    final borderRadius = BorderRadius.circular(16);
    double gapPadding = 6;
    final border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.black),
      gapPadding: gapPadding,
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.scienceBlue),
      gapPadding: gapPadding,
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.jasper),
      gapPadding: gapPadding,
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.greyShade700),
      gapPadding: gapPadding,
    );
    return InputDecorationTheme(
      errorStyle: AppFont.regular(
        color: AppColor.jasper,
      ),
      hintStyle: AppFont.regular(),
      border: border,
      enabledBorder: border,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      disabledBorder: disabledBorder,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      suffixIconColor: AppColor.black,
      prefixIconColor: AppColor.black,
      labelStyle: AppFont.regular(color: AppColor.black),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: AppFont.regular(color: AppColor.black),
    );
  }

  static InputDecorationTheme get darkTheme {
    final borderRadius = BorderRadius.circular(16);
    double gapPadding = 6;
    final border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.black),
      gapPadding: gapPadding,
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.scienceBlue),
      gapPadding: gapPadding,
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.jasper),
      gapPadding: gapPadding,
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: AppColor.greyShade700),
      gapPadding: gapPadding,
    );
    return InputDecorationTheme(
      errorStyle: AppFont.regular(
        color: AppColor.jasper,
      ),
      hintStyle: AppFont.regular(),
      border: border,
      enabledBorder: border,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      disabledBorder: disabledBorder,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      suffixIconColor: AppColor.black,
      prefixIconColor: AppColor.black,
      labelStyle: AppFont.regular(color: AppColor.black),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: AppFont.regular(color: AppColor.black),
    );
  }
}

class _AppColorScheme {
  static ColorScheme get lightColorScheme => ColorScheme(
        brightness: Brightness.light,

        /// the most used color in the app
        primary: AppColor.scienceBlue,

        /// used to color the elements on top of the primary color such as text, icons,..
        onPrimary: AppColor.white,
        secondary: AppColor.white,
        onSecondary: AppColor.white,
        error: AppColor.jasper,
        onError: AppColor.white,
        background: AppColor.white,
        onBackground: AppColor.black,

        /// used as the base color for elevated UI elements like cards, sheets, dialogs,...
        surface: AppColor.greyShade700,
        onSurface: AppColor.black,
      );

  static ColorScheme get darkColorScheme => ColorScheme(
        brightness: Brightness.dark,

        /// the most used color in the app
        primary: AppColor.scienceBlue,

        /// used to color the elements on top of the primary color such as text, icons,..
        onPrimary: AppColor.white,
        secondary: AppColor.white,
        onSecondary: AppColor.white,
        error: AppColor.jasper,
        onError: AppColor.white,
        background: AppColor.white,
        onBackground: AppColor.black,

        /// used as the base color for elevated UI elements like cards, sheets, dialogs,...
        surface: AppColor.greyShade700,
        onSurface: AppColor.black,
      );
}

class _AppButtonStyleTheme {
  static ButtonThemeData get lightTheme => ButtonThemeData();
}

class _AppBarTheme {
  static AppBarTheme get lightTheme => AppBarTheme(
        backgroundColor: AppColor.white,
        elevation: 0,
        foregroundColor: AppColor.white,
        titleTextStyle: AppFont.semiBold(),
        iconTheme: IconThemeData(
          size: 24,
          color: AppColor.black,
        ),
      );

  static AppBarTheme get darkTheme => AppBarTheme(
        backgroundColor: AppColor.white,
        elevation: 0,
        foregroundColor: AppColor.white,
        titleTextStyle: AppFont.semiBold(),
        iconTheme: IconThemeData(
          size: 24,
          color: AppColor.black,
        ),
      );
}
