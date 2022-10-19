import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon/pokemon.dart' hide Icons;
import 'package:pokedex/views/pokemon_detail/pokemon_detail_page.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonDetailPage(pokemon: pokemon),
          ),
        ),
        child: Material(
          type: MaterialType.card,
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        pokemon.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        min(pokemon.types.length, 2),
                        (index) => Chip(
                          backgroundColor: Colors.white30,
                          padding: const EdgeInsets.all(1),
                          label: Text(
                            pokemon.types[index].type.name,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Text(
                  '#${pokemon.id.toString().padLeft(3, '0')}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/icons/pokeball-card.svg',
                  width: 120,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: Image.network(
                  pokemon.image!,
                  width: 110,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
