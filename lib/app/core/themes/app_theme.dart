import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_tracker/app/core/themes/color_schemes.g.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(colorScheme: lightColorScheme);

  static final darkTheme = ThemeData(colorScheme: darkColorScheme);

  static Brightness? get currentSystemBrightness => SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static void setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: themeMode == ThemeMode.light ? lightColorScheme.background : darkColorScheme.background,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }
}

// extension ThemeExtras on ThemeData {
//   Color get particlesColor => brightness == Brightness.light ? lightColorScheme: AppTheme.darkParticlesColor;
// }
