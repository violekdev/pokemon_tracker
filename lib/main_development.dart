import 'package:flutter/material.dart';
import 'package:pokemon_tracker/app/app.dart';
import 'package:pokemon_tracker/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
