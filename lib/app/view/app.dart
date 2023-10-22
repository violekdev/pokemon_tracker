import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tracker/app/core/core.dart';
import 'package:pokemon_tracker/app/cubit/theme_cubit.dart';
import 'package:pokemon_tracker/app/router/app_router.dart';
import 'package:pokemon_tracker/pokedex/bloc/pokedex_bloc.dart';
import 'package:pokemon_tracker/pokemon/bloc/pokemon_bloc.dart';

final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<PokedexBloc>(create: (context) => PokedexBloc()),
        BlocProvider<PokemonBloc>(create: (context) => PokemonBloc()),
      ],
      child: const PokeStatApp(
        key: Key(Keys.pokeStat),
      ),
    );
  }
}

class PokeStatApp extends StatefulWidget {
  const PokeStatApp({required Key key}) : super(key: key);

  @override
  State<PokeStatApp> createState() => _PokeStatAppState();
}

class _PokeStatAppState extends State<PokeStatApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // BlocProvider.of<PokedexBloc>(context).add(GetPokedex());
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.goRouter,
    );
  }
}
