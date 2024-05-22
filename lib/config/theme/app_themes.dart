import 'package:flutter/material.dart';

const Color accentColor = Color(0xFF0549F6);
const Color textFieldPassiveColor = Color(0xFFE2E8F0);

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w500,
        height: 1.1,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: accentColor),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: getButtonStyle(context),
    ),
    textButtonTheme: TextButtonThemeData(
      style: getButtonStyle(context),
    ),
    inputDecorationTheme: getInputDecorationTheme(),
    appBarTheme: getAppBarTheme(context),
  );
}

AppBarTheme getAppBarTheme(BuildContext context) {
  return AppBarTheme(
    color: Colors.transparent,
    titleTextStyle: Theme.of(context).textTheme.titleMedium,
    scrolledUnderElevation: 0,
    centerTitle: true,
  );
}

InputDecorationTheme getInputDecorationTheme() {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: textFieldPassiveColor),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    hintStyle: const TextStyle(color: textFieldPassiveColor),
  );
}

ButtonStyle getButtonStyle(BuildContext context) {
  return ButtonStyle(
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 15,
      ),
    ),
    minimumSize: MaterialStatePropertyAll(
      Size(MediaQuery.of(context).size.width, 48),
    ),
    textStyle: MaterialStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.titleMedium!),
  );
}
