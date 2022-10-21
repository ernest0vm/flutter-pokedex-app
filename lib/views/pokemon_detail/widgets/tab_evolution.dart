import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapi/model/evolution/evolution-chain.dart';
import 'package:pokedex/models/pokemon/evolutions.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/extensions.dart';

class TabEvolution extends StatefulWidget {
  const TabEvolution({Key? key, required this.evolutionChain})
      : super(key: key);

  final EvolutionChain evolutionChain;

  @override
  State<TabEvolution> createState() => _TabEvolutionState();
}

class _TabEvolutionState extends State<TabEvolution> {
  List<Evolutions?> evolutions = <Evolutions?>[];
  @override
  void initState() {
    getEvolutionChain();
    super.initState();
  }

  void getEvolutionChain() {
    var evoChain = widget.evolutionChain.chain;
    var evoData = evoChain!.evolvesTo!.first;
    int val = 0;
    evolutions.add(Evolutions(
      pokeId: int.parse(evoChain.species!.id!),
      speciesName: evoChain.species!.name,
      minLevel: 1,
    ));

    do {
      val++;
      var evoDetail = evoData.evolutionDetails!.first;
      Evolutions evolution = Evolutions(
        pokeId: int.parse(evoData.species!.id!),
        speciesName: evoData.species!.name,
        item: evoDetail.item,
        minLevel: evoDetail.minLevel,
        triggerName: evoDetail.trigger!.name!,
      );

      if ((evolutions.singleWhere(
            (it) => it!.pokeId == evolution.pokeId,
            orElse: () => null,
          )) ==
          null) {
        evolutions.add(evolution);
      }

      if (evoData.evolvesTo!.isNotEmpty) {
        evoData = evoData.evolvesTo!.first;
      }
    } while (val <= 10);
    log(evolutions.toString());
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Evolution Chain',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                itemCount: evolutions.length - 1,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.dividerColor,
                  thickness: 3,
                ),
                itemBuilder: (context, index) => SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox.square(
                        dimension: 100,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                'assets/icons/pokeball-bg.svg',
                                fit: BoxFit.fitHeight,
                                color: Colors.black26,
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: evolutions[index]!.image,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/arrow.svg'),
                          const SizedBox(height: 10),
                          Text(
                            evolutions[index + 1]!.minLevel != null
                                ? 'Lvl ${evolutions[index + 1]!.minLevel}'
                                : evolutions[index + 1]!
                                    .triggerName!
                                    .replaceAll('-', ' ')
                                    .capitalize!,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox.square(
                        dimension: 100,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                'assets/icons/pokeball-bg.svg',
                                fit: BoxFit.fitHeight,
                                color: Colors.black26,
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: evolutions[index + 1]!.image,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
