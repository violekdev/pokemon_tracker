import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/app/cubit/theme_cubit.dart';
import 'package:pokemon_tracker/app/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        context
          ..pop()
          ..goNamed(AppRouter.home);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: context.read<ThemeCubit>().state.themeMode == ThemeMode.light ? [AppTheme.lightPrimaryColor, AppTheme.lightAccentColor] : [AppTheme.darkPrimaryColor, AppTheme.darkAccentColor],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.star,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}