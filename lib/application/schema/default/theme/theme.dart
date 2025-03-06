import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: ThemeColors.blue[500],
  scaffoldBackgroundColor: ThemeColors.grey[800],
  appBarTheme: AppBarTheme(
    color: ThemeColors.blue[500],
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //ThemeColors.blue[500],
    ),
    titleTextStyle: TextStyle(
      color: ThemeColors.grey[800],
      fontSize: 24.0,
    ),
    iconTheme: IconThemeData(color: ThemeColors.grey[800]),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 22.0,
      color: ThemeColors.blue[500],
    ),
    //Body default text
    bodyMedium: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 18.0,
      color: ThemeColors.blue[500],
    ),
    bodySmall: TextStyle(
      color: ThemeColors.blue[500],
    ),
    labelLarge: TextStyle(
      color: ThemeColors.blue[500],
    ),
    labelSmall: TextStyle(
      color: ThemeColors.blue[500],
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ThemeColors.blue[500],
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.grey[400]!,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.grey[700]!,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.blue[400]!,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    errorStyle: const TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: Colors.red,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    labelStyle: TextStyle(
      fontSize: 14,
      color: ThemeColors.blue[500],
    ),
    filled: true,
    fillColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size(
          double.infinity,
          48.0,
        ),
      ),
      maximumSize: MaterialStateProperty.all(
        const Size(
          double.infinity,
          56.0,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(
        ThemeColors.blue[400],
      ),
      foregroundColor: MaterialStateProperty.all(
        Colors.white,
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: 'Outfit',
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(ThemeColors.blue[400]),
    ),
  ),
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderColor: ThemeColors.grey[400],
    selectedColor: ThemeColors.blue[400],
    selectedBorderColor: ThemeColors.blue[400],
    disabledColor: ThemeColors.grey[500],
    color: ThemeColors.grey[800],
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: ThemeColors.blue[400],
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(ThemeColors.blue[400]),
    side: MaterialStateBorderSide.resolveWith((states) {
      return BorderSide(color: ThemeColors.blue[500]!);
    }),
    fillColor: MaterialStateProperty.all(Colors.white),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(ThemeColors.blue[400]),
  ),
);

final ThemeData darkThemeData = lightThemeData.copyWith(
  brightness: Brightness.dark,
  primaryColor: ThemeColors.grey[800],
  scaffoldBackgroundColor: ThemeColors.blue[500],
  appBarTheme: AppBarTheme(
    color: ThemeColors.grey[800],
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //ThemeColors.blue[500],
    ),
    titleTextStyle: TextStyle(color: ThemeColors.grey[800]),
    iconTheme: IconThemeData(color: ThemeColors.grey[800]),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: ThemeColors.grey[800],
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 22.0,
      color: ThemeColors.grey[800],
    ),
    //Body default text
    bodyMedium: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 18.0,
      color: ThemeColors.grey[800],
    ),
    bodySmall: TextStyle(
      color: ThemeColors.grey[800],
    ),
    labelLarge: TextStyle(
      color: ThemeColors.grey[800],
    ),
    labelSmall: TextStyle(
      color: ThemeColors.grey[800],
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ThemeColors.blue[500],
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.blue[400]!,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.blue[500]!,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.blue[400]!,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    errorStyle: const TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: Colors.red,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12.0),
    ),
    labelStyle: TextStyle(
      fontSize: 14,
      color: ThemeColors.blue[500],
    ),
    filled: true,
    fillColor: ThemeColors.grey[800],
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size(
          double.infinity,
          48.0,
        ),
      ),
      maximumSize: MaterialStateProperty.all(
        const Size(
          double.infinity,
          56.0,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(
        ThemeColors.blue[400],
      ),
      foregroundColor: MaterialStateProperty.all(
        Colors.white,
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: 'Outfit',
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(ThemeColors.grey[800]),
    ),
  ),
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderColor: ThemeColors.grey[400],
    selectedColor: ThemeColors.blue[400],
    selectedBorderColor: ThemeColors.blue[400],
    disabledColor: ThemeColors.grey[500],
    color: ThemeColors.grey[800],
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: ThemeColors.grey[800],
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    side: MaterialStateBorderSide.resolveWith((states) {
      return BorderSide(color: ThemeColors.blue[500]!);
    }),
    fillColor: MaterialStateProperty.all(ThemeColors.blue[400]),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(ThemeColors.blue[400]),
  ),
  dialogBackgroundColor: ThemeColors.blue[500],
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 22.0,
      color: ThemeColors.grey[800],
    ),
    subtitleTextStyle: TextStyle(
      fontFamily: 'Outfit',
      fontSize: 16.0,
      color: ThemeColors.grey[500],
    ),
  ),
);

Color highlightEdgesColor(BuildContext context) {
  var themeMode = EasyDynamicTheme.of(context).themeMode!; //WidgetsBinding.instance.platformDispatcher.platformBrightness;

  return switch (themeMode) {
    ThemeMode.dark => ThemeColors.yellow[300],
    ThemeMode.light => ThemeColors.blue[500],
    _ => Colors.red,
  }!;
}
