import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

// Color(0xFFEF5350),
// Color(0xFFFFCDD2),
// Color(0xFFFFEBEE),

class AppTheme {
  const AppTheme._();

  static Color lightBackgroundColor = const Color(0xFFFFFFFF);
  static Color lightSideMenuBackgroundColor = const Color(0xFFF44336);
  static Color lightPrimaryColor = const Color(0xFFEF5350);
  static Color lightOnPrimaryColor = const Color(0xFFFFFFFF);
  static Color lightAccentColor = const Color(0xFFFF9DD2);
  static Color lightButtonColor = const Color(0xFFEF5350);
  static Color lightDisabledColor = const Color(0xFFFFCDD2);
  static Color lightCardColor = const Color(0xFFFFEBEE);
  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkBackgroundColor = Colors.blueGrey.shade900;
  static Color darkSideMenuBackgroundColor = const Color(0xFF1F2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkOnPrimaryColor = const Color(0xFFFFFFFF);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkButtonColor = Colors.blueGrey.shade600;
  static Color darkDisabledColor = const Color(0xFF1A2127);
  static Color darkCardColor = const Color(0xFF1F2127);
  static Color darkParticlesColor = const Color(0x441C2A3D);

  static final lightTheme = ThemeData(
    // brightness: Brightness.light,
    // primaryColor: lightPrimaryColor,
    // cardColor: lightCardColor,
    cardTheme: CardTheme(color: lightCardColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(buttonColor: lightButtonColor),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color?>(lightButtonColor))),
    disabledColor: lightDisabledColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightAccentColor,
      brightness: Brightness.light,
      primary: lightPrimaryColor,
      onPrimary: lightOnPrimaryColor,
      background: lightBackgroundColor,
    ),
  );

  static final darkTheme = ThemeData(
    // brightness: Brightness.dark,
    // primaryColor: darkPrimaryColor,
    // cardColor: darkCardColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardTheme: CardTheme(color: darkCardColor),
    buttonTheme: ButtonThemeData(buttonColor: darkButtonColor),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color?>(darkButtonColor))),
    disabledColor: darkDisabledColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: darkAccentColor,
      brightness: Brightness.dark,
      primary: darkPrimaryColor,
      onPrimary: darkOnPrimaryColor,
      background: darkBackgroundColor,
    ),
  );

  static Brightness? get currentSystemBrightness => SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static void setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: themeMode == ThemeMode.light ? lightBackgroundColor : darkBackgroundColor,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => brightness == Brightness.light ? AppTheme.lightParticlesColor : AppTheme.darkParticlesColor;
}
