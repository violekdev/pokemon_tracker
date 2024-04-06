import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_tracker/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';
import 'package:pokemon_tracker/pokemon/widgets/pokemon_asset_view.dart';

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
          if (state is PokemonError) {
            return Column(
              children: [
                PokemonAssetView(frontImage: state.pokemonImageUrl),
                // TODO(krishna): change widget SelectableText -> Text
                Center(child: SelectableText(state.message)),
              ],
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.name[0].toUpperCase() + state.name.substring(1), style: Theme.of(context).textTheme.headlineLarge),
                                Text('#${state.id}', style: Theme.of(context).textTheme.headlineLarge),
                                // Text('#${colorSchemeFromImage.background}', style: Theme.of(context).textTheme.headlineLarge),
                              ],
                            ),
                            if (state is PokemonLoaded)
                              Row(
                                children: state.pokemon.types!.map((type) {
                                  return TypeContainer(type: type);
                                }).toList(),
                              ),
                          ],
                        ),
                      ),
                      PokemonAssetView(
                        backImage: state.pokemonImageUrl,
                        frontImage: state.pokemonImageUrl,
                      ),
                    ],
                  ),
                  if (state is PokemonInitial || state is PokemonLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (state is PokemonLoaded) ...[
                    StatIndicator(stats: state.pokemon.stats!),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Text(state.pokemon.description!),
                    ),
                  ],
                ],
              ),
            ),
          );
          // if (state is PokemonInitial || state is PokemonLoading) {
          //   return Column(
          //     children: [
          //       PokemonAssetView(frontImage: state.pokemonImageUrl),
          //       const Center(child: CircularProgressIndicator()),
          //     ],
          //   );
          //   // } else if (state is PokemonLoading) {
          //   //   return _buildLoading();
          // } else if (state is PokemonLoaded) {
          //   return PokemonData(pokemon: state.pokemon);
          //   // } else if (state is PokemonError) {
          //   //   return Container();
          // }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context)..pop(),
      //   child: const Icon(Icons.arrow_back),
      // ),
    );
  }
}

class TypeContainer extends StatelessWidget {
  const TypeContainer({
    required this.type,
    super.key,
  });

  final Types type;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.12,
      height: screenSize.height * 0.05,
      child: CachedNetworkImage(
        imageUrl: type.type.url,
        cacheKey: type.type.url,
        height: screenSize.height * 0.05,
      ),
    );
  }
}

class StatIndicator extends StatelessWidget {
  const StatIndicator({
    required this.stats,
    super.key,
  });

  final List<Stats> stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FlexColumnWidth(4),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(7),
        },
        children: [
          ...stats.map((stat) {
            return TableRow(
              children: [
                TableCell(child: Text(stat.stat.name!.toUpperCase())),
                TableCell(child: Text(stat.baseStat.toString().trim())),
                TableCell(
                  child: LinearProgressIndicator(
                    value: stat.baseStat! / 100,
                    semanticsLabel: '${stat.stat.name!.toUpperCase()} indicator',
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
