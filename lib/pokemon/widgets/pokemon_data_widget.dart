import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';
import 'package:pokemon_tracker/pokemon/widgets/pokemon_asset_view.dart';

class PokemonData extends StatelessWidget {
  const PokemonData({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
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
                          Text(pokemon.name![0].toUpperCase() + pokemon.name!.substring(1), style: Theme.of(context).textTheme.headlineLarge),
                          Text('#${pokemon.id}', style: Theme.of(context).textTheme.headlineLarge),
                          // Text('#${colorSchemeFromImage.background}', style: Theme.of(context).textTheme.headlineLarge),
                        ],
                      ),
                      Row(
                        children: pokemon.types!.map((type) {
                          return TypeContainer(type: type);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                PokemonAssetView(
                  backImage: pokemon.types!.first.type.url,
                  frontImage: pokemon.sprites!.other.homeSprites!.frontDefault!,
                ),
              ],
            ),
            StatIndicator(stats: pokemon.stats!),
          ],
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
      child: Table(defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
