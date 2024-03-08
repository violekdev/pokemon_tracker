import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_tracker/app/core/constants/strings.dart';
import 'package:pokemon_tracker/app/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
              child: Text(
                'What are you looking for?',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SearchBar(
              hintText: 'Search pokemons, items, etc...',
              leading: IconButton(
                onPressed: null,
                icon: Icon(Icons.search_rounded),
              ),
              trailing: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.mic),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            GestureDetector(
              onTap: () => context.pushNamed(AppRouter.pokedex),
              child: Container(
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.9,
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: CachedNetworkImageProvider('https://archives.bulbagarden.net/media/upload/7/79/Dream_Pok%C3%A9_Ball_Sprite.png'),
                    alignment: Alignment.bottomRight,
                    opacity: 0.5,
                  ),
                ),
                child: Text(
                  'Pokémon',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.01),
            SizedBox(
              height: screenSize.height * 0.4,
              width: screenSize.width * 0.9,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 5 / 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 8,
                children: [
                  CategoryTileWidget(
                    title: 'Items',
                    color: Colors.orange.shade800,
                    route: '',
                    iconUrl: PokemonAssetsUrl.pokemonItemBag,
                  ),
                  CategoryTileWidget(
                    title: 'Moves',
                    color: Colors.blue.shade800,
                    route: '',
                    iconUrl: 'https://tcg.pokemon.com/assets/img/expansions/tcg-go/global/tips-icon--0.png',
                  ),
                  CategoryTileWidget(
                    title: 'Types',
                    color: Colors.yellow.shade800,
                    route: '',
                    iconUrl: PokemonAssetsUrl.pokeTypesIcons['electric']!,
                  ),
                  CategoryTileWidget(
                    title: 'Favorite',
                    color: Colors.purple.shade800,
                    route: '',
                    iconUrl: 'https://archives.bulbagarden.net/media/upload/thumb/a/ad/GO_Best_Buddy_Ribbon.png/140px-GO_Best_Buddy_Ribbon.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTileWidget extends StatelessWidget {
  const CategoryTileWidget({
    required this.color,
    required this.title,
    required this.route,
    required this.iconUrl,
    super.key,
  });

  final Color color;
  final String title;
  final String route;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(route),
      child: Container(
        padding: const EdgeInsets.only(left: 8, bottom: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: CachedNetworkImageProvider(iconUrl),
            alignment: Alignment.bottomRight,
            opacity: 0.5,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
