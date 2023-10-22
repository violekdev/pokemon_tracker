import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_tracker/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_tracker/pokemon/widgets/pokemon_data_widget.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PokemonBloc, PokemonState>(
          buildWhen: (context, state) {
            return state is PokemonLoaded || state is PokemonLoading || state is PokemonInitial || state is PokemonError;
          },
          builder: (context, state) {
            if (state is PokemonInitial || state is PokemonLoading) {
              return _buildLoading();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)..pop(),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  // Widget _buildCard(BuildContext context, Pokemon pokemon) {
  //   // return Text(id.toString());
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         CarouselSlider(
  //           // options: CarouselOptions(height: 400.0),
  //           options: CarouselOptions(
  //             autoPlay: false,
  //             // enlargeStrategy: CenterPageEnlargeStrategy.scale,
  //             enableInfiniteScroll: true,
  //             enlargeCenterPage: true,
  //             viewportFraction: 0.4,
  //             aspectRatio: 2,
  //             initialPage: 2,
  //           ),
  //           items: [
  //             pokemon.sprites?.backDefault,
  //             pokemon.sprites?.backShiny,
  //             pokemon.sprites?.frontDefault,
  //             pokemon.sprites?.frontShiny,
  //           ].map((i) {
  //             return Builder(
  //               builder: (BuildContext context) {
  //                 return Container(
  //                   width: MediaQuery.of(context).size.width,
  //                   margin: const EdgeInsets.symmetric(
  //                       horizontal: 5.0, vertical: 5.0),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(5.0),
  //                     color: Colors.white,
  //                     boxShadow: const [
  //                       BoxShadow(
  //                         color: Colors.grey,
  //                         offset: Offset(0.0, 1.0), //(x,y)
  //                         blurRadius: 6.0,
  //                       ),
  //                     ],
  //                   ),
  //                   child: Image.network(i!),
  //                 );
  //               },
  //             );
  //           }).toList(),
  //         ),
  //         Text(pokemon.name!),
  //         Text(pokemon.height.toString()),
  //         // Text(pokemon.moves.toString()),
  //         Row(
  //           children: [
  //             const Text("Type"),
  //             const SizedBox(
  //               width: 20,
  //             ),
  //             Row(
  //               children: pokemon.types!.map((type) {
  //                 return CachedNetworkImage(
  //                   imageUrl: type.type!,
  //                 );
  //               }).toList(),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
