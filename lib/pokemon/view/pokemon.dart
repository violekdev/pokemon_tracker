import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_tracker/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_tracker/pokemon/widgets/pokemon_data_widget.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(forceMaterialTransparency: true),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        buildWhen: (context, state) {
          return state is PokemonLoaded || state is PokemonLoading || state is PokemonInitial || state is PokemonError;
        },
        builder: (context, state) {
          if (state is PokemonInitial || state is PokemonLoading) {
            return const Center(child: CircularProgressIndicator());
            // } else if (state is PokemonLoading) {
            //   return _buildLoading();
          } else if (state is PokemonLoaded) {
            return PokemonData(pokemon: state.pokemon);
            // } else if (state is PokemonError) {
            //   return Container();
          } else if (state is PokemonError) {
            return Text(state.message);
            // } else if (state is PokemonError) {
            //   return Container();
          } else {
            return Container();
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context)..pop(),
      //   child: const Icon(Icons.arrow_back),
      // ),
    );
  }
}
