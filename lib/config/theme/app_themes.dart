import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color accentColor = Color(0xFF1EB1E7);
const Color textFieldPassiveColor = Color(0xFFE2E8F0);
const Color containersColor = Color(0xFFF1F5F9);
const Color unselectedItemColor = Color(0xFFADBECE);
const Color borderColor = Color(0xFFE2E8F0);
const Color textFieldTextColor = Color(0xFF64748B);
const Color lightButton = Color(0xFFD6E7F8);
const Color splashButtonColor = Color.fromARGB(255, 133, 216, 255);
const Color secondaryColor = Color(0xFF74C6C8);
const List<Color> diagramColors = [
  Color(0xFFfd7f6f),
  Color(0xFF7eb0d5),
  Color(0xFFb2e061),
  Color(0xFFbd7ebe),
  Color(0xFFffb55a),
  Color(0xFFffee65),
  Color(0xFFbeb9db),
  Color(0xFFfdcce5),
  Color(0xFF8bd3c7),
];

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'Ubuntu',
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 35,
        fontWeight: FontWeight.w500,
        height: 1.1,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: accentColor),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: getButtonStyle(context),
    ),
    textButtonTheme: TextButtonThemeData(
      style: getTextButtonStyle(context),
    ),
    inputDecorationTheme: getInputDecorationTheme(),
    appBarTheme: getAppBarTheme(context),
    bottomNavigationBarTheme: getBottomNavBarThemeData(),
    chipTheme: getChipThemeData(),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: accentColor),
  );
}

ChipThemeData getChipThemeData() {
  return const ChipThemeData(
    side: BorderSide(color: Colors.transparent),
    shape: StadiumBorder(),
    backgroundColor: containersColor,
    selectedColor: accentColor,
  );
}

BottomNavigationBarThemeData getBottomNavBarThemeData() {
  return const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: accentColor,
    unselectedItemColor: unselectedItemColor,
  );
}

AppBarTheme getAppBarTheme(BuildContext context) {
  return AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    color: Colors.transparent,
    iconTheme: const IconThemeData(color: accentColor),
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
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: accentColor, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    hintStyle: const TextStyle(color: textFieldPassiveColor),
  );
}

InputDecoration getChangeInputDecoration() {
  return const InputDecoration(
    hintText: '',
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    fillColor: containersColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    suffixIcon: Icon(
      Icons.close_rounded,
      size: 17,
      color: unselectedItemColor,
    ),
  );
}

ButtonStyle getButtonStyle(BuildContext context) {
  return ButtonStyle(
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 15,
      ),
    ),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return const StadiumBorder();
        } else if (states.contains(WidgetState.disabled)) {
          return const StadiumBorder(
            side: BorderSide(
              color: unselectedItemColor,
              width: 2,
            ),
          );
        }
        return const StadiumBorder();
      },
    ),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return accentColor;
        } else if (states.contains(WidgetState.disabled)) {
          return Colors.transparent;
        }
        return accentColor;
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return Colors.white;
        } else if (states.contains(WidgetState.disabled)) {
          return unselectedItemColor;
        }
        return Colors.white; // Use the component's default.
      },
    ),
    overlayColor: const WidgetStatePropertyAll(splashButtonColor),
    minimumSize: WidgetStatePropertyAll(
      Size(MediaQuery.of(context).size.width, 48),
    ),
    textStyle: WidgetStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.titleMedium!),
  );
}

ButtonStyle getTextButtonStyle(BuildContext context) {
  return ButtonStyle(
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 15,
      ),
    ),
    minimumSize: WidgetStatePropertyAll(
      Size(MediaQuery.of(context).size.width, 48),
    ),
    foregroundColor: const WidgetStatePropertyAll(accentColor),
    textStyle: WidgetStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.titleMedium!),
  );
}
