import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tracker/pokemon/src/model.dart';

class SpritesViewer extends StatefulWidget {
  const SpritesViewer({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  State<SpritesViewer> createState() => _SpritesViewerState();
}

class _SpritesViewerState extends State<SpritesViewer> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        // enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
        aspectRatio: 2,
        initialPage: 2,
      ),
      items: [
        widget.pokemon.sprites?.backDefault,
        widget.pokemon.sprites?.backShiny,
        widget.pokemon.sprites?.frontDefault,
        widget.pokemon.sprites?.frontShiny,
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                    blurRadius: 6,
                  ),
                ],
              ),
              // child: Image.network(i!),
            );
          },
        );
      }).toList(),
    );
  }
}
