import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Image.network(pokemon.image!)),
      );
}
