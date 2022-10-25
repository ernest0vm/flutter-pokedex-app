import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/views/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex/widgets/fav_button.dart';
import 'package:pokedex/widgets/type_chip.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonDetailPage(
              pokemon: pokemon,
              backgroundGradient: AppColors
                  .colorByPokemonType[pokemon.types!.first.type!.name]!,
            ),
          ),
        ),
        child: Material(
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAlias,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient:
                  AppColors.colorByPokemonType[pokemon.types!.first.type!.name],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          pokemon.name!.capitalize!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          min(pokemon.types!.length, 2),
                          (index) => TypeChip(
                              typeName: pokemon.types![index].type!.name!),
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
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.4),
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
                  child: Hero(
                    tag: pokemon.name!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.getImageUrl,
                      width: 120,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: FavButton(pokeId: pokemon.id!),
                ),
              ],
            ),
          ),
        ),
      );
}
