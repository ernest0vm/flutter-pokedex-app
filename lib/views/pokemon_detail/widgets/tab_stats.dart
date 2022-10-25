import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/views/pokemon_detail/widgets/stat_tile.dart';

class TabStats extends StatelessWidget {
  const TabStats({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  int getTotalBaseStat() {
    int total = 0;
    for (Stats stats in pokemon.stats!) {
      total += stats.baseStat!;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                itemCount: pokemon.stats!.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => StatTile(
                  statName: pokemon.stats![index].stat!.name!,
                  baseStat: pokemon.stats![index].baseStat!,
                ),
              ),
              StatTile(
                statName: 'Total',
                baseStat: getTotalBaseStat(),
                maxProgressBarValue: pokemon.stats!.length * 100,
                changeColorValue:
                    (((pokemon.stats!.length * 100) / 5) * 4).round(),
              )
            ],
          ),
        ),
      );
}
