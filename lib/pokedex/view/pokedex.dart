import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tracker/app/core/constants/strings.dart';
import 'package:pokemon_tracker/pokedex/bloc/pokedex_bloc.dart';
import 'package:pokemon_tracker/pokedex/widgets/pokedex_widget.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TitleStrings.pokedexScreenTitle),
      ),
      body: BlocBuilder<PokedexBloc, PokedexState>(
        // buildWhen: (context, state) {
        //   return state is PokedexLoaded ||
        //       state is PokedexLoading ||
        //       state is PokedexInitial;
        // },
        builder: (context, state) {
          if (state is PokedexInitial || state is PokedexLoading) {
            return const Center(child: CircularProgressIndicator());
            // return _buildLoading();
            // } else if (state is PokedexLoading) {
            //   return _buildLoading();
          } else if (state is PokedexLoaded) {
            return PokedexWidget(pokedex: state.pokedex);
            // } else if (state is PokedexError) {
            //   return Container();
          } else if (state is PokedexError) {
            // return PokedexWidget(pokedex: state.pokedex);
            // } else if (state is PokedexError) {
            return Text(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

// Widget _buildLoading() => const Center(child: CircularProgressIndicator());
