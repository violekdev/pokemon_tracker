import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_tracker/app/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColoredBox(
          color: Colors.lightBlueAccent,
          child: ListView(
            children: [
              ListTile(
                title: TextButton(
                  onPressed: () => context.goNamed(AppRouter.pokedex),
                  child: const Text('Pokedex'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
