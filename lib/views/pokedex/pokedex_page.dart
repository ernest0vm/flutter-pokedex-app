import 'package:flutter/material.dart';
import 'package:pokedex/managers/stream_manager.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Pokemon>>(
      stream: StreamManager.instance.pokemonListStream,
      initialData: const <Pokemon>[],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4 / 3,
              children: List.generate(
                snapshot.data!.length,
                (index) => PokemonCard(pokemon: snapshot.data![index]),
              ),
            ),
          );
        }
        return Container();
      });
}
