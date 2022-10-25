import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/managers/favorites_manager.dart';
import 'package:pokedex/widgets/custom_sliver_appbar.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => const [
          CustomSliverAppBar(
            title: 'Favorites',
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder<List<Pokemon>>(
              stream: FavoritesManager.instance.favoritePokemonListStream,
              initialData: const <Pokemon>[],
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4 / 3,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => PokemonCard(pokemon: snapshot.data![index]),
                    ),
                  );
                }
                return Container();
              }),
        ),
      );
}
