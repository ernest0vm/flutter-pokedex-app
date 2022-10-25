import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon/pokemon.dart' hide Icons;
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/extensions.dart';

class TabMoves extends StatelessWidget {
  const TabMoves({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Move',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.midBlackTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Learned At',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.midBlackTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Learn Method',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.midBlackTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.builder(
                itemCount: pokemon.moves.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(pokemon.moves[index].move.name
                                .toString()
                                .replaceAll('-', ' ')
                                .capitalize!),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              pokemon.moves[index].versionGroupDetails.first
                                  .levelLearnedAt
                                  .toString(),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              pokemon.moves[index].versionGroupDetails.first
                                  .moveLearnMethod.name
                                  .replaceAll('-', ' ')
                                  .capitalize!,
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
