import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_tracker/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';
import 'package:pokemon_tracker/pokemon/widgets/pokemon_asset_view.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.name[0].toUpperCase() + state.name.substring(1), style: Theme.of(context).textTheme.headlineLarge),
                                Text('#${state.id}', style: Theme.of(context).textTheme.headlineLarge),
                                // Text('#${colorSchemeFromImage.background}', style: Theme.of(context).textTheme.headlineLarge),
                              ],
                            ),
                          ),
                          if (state is PokemonLoaded)
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: state.pokemon.types!.map((type) {
                                  return TypeContainer(type: type);
                                }).toList(),
                              ),
                            ),
                          Container(
                            margin: EdgeInsets.only(top: screenSize.height * 0.2),
                            padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
                            decoration: const BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            child: (state is PokemonInitial || state is PokemonLoading)
                                ? const Center(child: CircularProgressIndicator())
                                : (state is PokemonLoaded)
                                    ? DefaultTabController(
                                        length: 3,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TabBar(
                                              dividerHeight: 0,
                                              // indicator: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                                              // labelColor: Theme.of(context).colorScheme.onPrimary,
                                              tabs: [
                                                PokemonDetailsTabWidget(
                                                  label: 'Info',
                                                  width: 60,
                                                  key: Key('${state.name}TabViewInfo'),
                                                ),
                                                PokemonDetailsTabWidget(
                                                  label: 'Evolution',
                                                  width: 100,
                                                  key: Key('${state.name}TabViewInfo'),
                                                ),
                                                PokemonDetailsTabWidget(
                                                  label: 'Moves',
                                                  width: 72,
                                                  key: Key('${state.name}TabViewInfo'),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.5,
                                              child: TabBarView(
                                                children: [
                                                  Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                        child: Text(
                                                          state.pokemon.description!,
                                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                                                        ),
                                                      ),
                                                      StatIndicator(stats: state.pokemon.stats!),
                                                    ],
                                                  ),
                                                  Container(),
                                                  Container(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                          ),
                        ],
                      ),
                      PokemonAssetView(
                        backImage: state.pokemonImageUrl,
                        frontImage: state.pokemonImageUrl,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PokemonDetailsTabWidget extends StatelessWidget {
  const PokemonDetailsTabWidget({
    required this.label,
    required this.width,
    super.key,
  });

  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: width,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
      ),
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
                TableCell(
                  child: Text(
                    stat.stat.name!.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
                TableCell(
                  child: Text(
                    stat.baseStat.toString().trim(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
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
