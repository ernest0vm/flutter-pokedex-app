import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokedex/models/pokemon/pokemon.dart' hide Icons;
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/utils.dart';

class TabAbout extends StatelessWidget {
  const TabAbout({Key? key, required this.pokemon, required this.pokemonSpecie})
      : super(key: key);

  final Pokemon pokemon;
  final PokemonSpecie pokemonSpecie;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                pokemonSpecie.flavorTextEntries!.first.flavorText!
                    .replaceAll('\n', ' '),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              const SizedBox(height: 20),
              Material(
                type: MaterialType.card,
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 70),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Height',
                              style:
                                  TextStyle(color: AppColors.midBlackTextColor),
                            ),
                            const SizedBox(height: 10),
                            Text(
                                '${Utils.dmToFt(pokemon.height)} (${Utils.dmToCm(pokemon.height)})'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Weight',
                              style:
                                  TextStyle(color: AppColors.midBlackTextColor),
                            ),
                            const SizedBox(height: 10),
                            Text(
                                '${Utils.hgToLb(pokemon.weight)} (${Utils.hgToKg(pokemon.weight)})'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Breeding',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: AppColors.midBlackTextColor),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Egg Groups',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: AppColors.midBlackTextColor),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Egg Cycle',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: AppColors.midBlackTextColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.male,
                            size: 20,
                            color: AppColors.maleIconColor,
                          ),
                          Text(
                            Utils.genterPercent(8 - pokemonSpecie.genderRate!),
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.female,
                            size: 20,
                            color: AppColors.femaleIconColor,
                          ),
                          Text(
                            Utils.genterPercent(pokemonSpecie.genderRate!),
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        pokemonSpecie.eggGroups!.first.name!.capitalize!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        pokemonSpecie.eggGroups!.last.name!.capitalize!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Location',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              const Text(
                'Training',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Base EXP',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: AppColors.midBlackTextColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.baseExperience.toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
