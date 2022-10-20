import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';

class TabAbout extends StatelessWidget {
  const TabAbout({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<PokemonSpecie?>(
              future: PokeAPI.getObject<PokemonSpecie>(pokemon.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  log(snapshot.data!.flavorTextEntries!.first.flavorText!);
                  return Row(
                    children: [
                      Expanded(
                        child: Text(snapshot
                            .data!.flavorTextEntries!.first.flavorText!
                            .replaceAll('\n', '')),
                      ),
                    ],
                  );
                }
                return Container();
              }),
        ],
      );
}
