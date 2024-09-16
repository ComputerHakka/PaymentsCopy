import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color accentColor = Color(0xFF1EB1E7);
const Color optionBoxCircleColor = Color(0xFFDEECF2);
const Color textFieldPassiveColor = Color(0xFFE2E8F0);
const Color containersColor = Color(0xFFF1F5F9);
const Color unselectedItemColor = Color(0xFFADBECE);
const Color borderColor = Color(0xFFE2E8F0);
const Color textFieldTextColor = Color(0xFF64748B);
const Color lightButton = Color(0xFFD6E7F8);
const Color mainIconsContainerColor = Color(0xFFCBD5E1);
const Color splashButtonColor = Color.fromARGB(255, 133, 216, 255);
const Color secondaryColor = Color(0xFF74C6C8);
const Color documentIconColor = Color(0xFFB01C40);
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

// const Color secondaryColorDark = Color(0xFF60FFA9);
// const Color containersColorDark = Color(0xFF14141A);
// const Color containersSecondaryColor = Color(0xFF13252E);
// const Color unselectedItemColor = Color(0xFFADBECE);
// const Color borderColor = Color(0xFFE2E8F0);
// const Color textFieldTextColor = Color(0xFF64748B);
// const Color lightButton = Color.fromARGB(255, 54, 84, 114);
// const Color splashButtonColor = Color.fromARGB(255, 53, 148, 192);
// const Color someColor = Color.fromARGB(186, 96, 207, 255);
// const Color textMainColor = Colors.white;

ThemeData appTheme(BuildContext context, {bool isDarkMode = false}) {
  return ThemeData(
    fontFamily: 'Ubuntu',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          allowEnterRouteSnapshotting: false,
        ),
      },
    ),
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 35,
        fontWeight: FontWeight.w500,
        height: 1.1,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      titleLarge: const TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      tertiary: isDarkMode ? const Color(0xFF14141A) : const Color(0xFFF1F5F9),
      tertiaryFixed:
          isDarkMode ? const Color(0xFF13252E) : const Color(0xFFDEECF2),
    ),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: getButtonStyle(context, isDarkMode),
    ),
    textButtonTheme: TextButtonThemeData(
      style: getTextButtonStyle(context, isDarkMode),
    ),
    inputDecorationTheme: getInputDecorationTheme(isDarkMode),
    appBarTheme: getAppBarTheme(isDarkMode),
    bottomNavigationBarTheme: getBottomNavBarThemeData(isDarkMode),
    chipTheme: getChipThemeData(isDarkMode),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: accentColor),
  );
}

ChipThemeData getChipThemeData(bool isDarkMode) {
  return ChipThemeData(
    side: const BorderSide(color: Colors.transparent),
    shape: const StadiumBorder(),
    backgroundColor:
        isDarkMode ? const Color(0xFF14141A) : const Color(0xFFF1F5F9),
    selectedColor: accentColor,
  );
}

BottomNavigationBarThemeData getBottomNavBarThemeData(bool isDarkMode) {
  return BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: isDarkMode ? Colors.black : Colors.white,
    selectedItemColor: accentColor,
    unselectedItemColor: unselectedItemColor,
  );
}

AppBarTheme getAppBarTheme(bool isDarkMode) {
  return AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? Colors.black : Colors.white,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
    ),
    color: Colors.transparent,
    iconTheme: const IconThemeData(color: accentColor),
    scrolledUnderElevation: 0,
    centerTitle: true,
  );
}

InputDecorationTheme getInputDecorationTheme(bool isDarkMode) {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
          color: isDarkMode ? textFieldTextColor : textFieldPassiveColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: accentColor, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    hintStyle: const TextStyle(color: textFieldPassiveColor),
  );
}

InputDecoration getChangeInputDecoration(bool isDarkMode) {
  return InputDecoration(
    hintText: '',
    filled: true,
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    fillColor: isDarkMode ? const Color(0xFF14141A) : const Color(0xFFF1F5F9),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    suffixIcon: const Icon(
      Icons.close_rounded,
      size: 17,
      color: unselectedItemColor,
    ),
  );
}

ButtonStyle getButtonStyle(BuildContext context, bool isDarkMode) {
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
    overlayColor: WidgetStatePropertyAll(isDarkMode
        ? const Color.fromARGB(255, 53, 148, 192)
        : const Color.fromARGB(255, 133, 216, 255)),
    minimumSize: WidgetStatePropertyAll(
      Size(MediaQuery.of(context).size.width, 48),
    ),
    textStyle: WidgetStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.titleMedium!),
  );
}

ButtonStyle getTextButtonStyle(BuildContext context, bool isDarkMode) {
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
