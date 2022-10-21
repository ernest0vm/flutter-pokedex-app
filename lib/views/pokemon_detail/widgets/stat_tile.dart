import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/extensions.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    Key? key,
    required this.stat,
    required this.baseStat,
    this.maxProgressBarValue = 100,
    this.changeColorValue = 80,
  }) : super(key: key);

  final Stat stat;
  final int baseStat;
  final int maxProgressBarValue;
  final int changeColorValue;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: Row(
          children: [
            SizedBox(
              width: 70,
              child: Text(
                stat.name
                    .replaceAll('special-attack', 'sp. atk')
                    .replaceAll('special-defense', 'sp. def')
                    .capitalize!,
                style: TextStyle(
                  color: AppColors.midBlackTextColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: Text(
                baseStat.toString(),
                style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: FAProgressBar(
                size: 5,
                currentValue: baseStat.toDouble(),
                backgroundColor: AppColors.noStatColor,
                changeColorValue: changeColorValue,
                changeProgressColor: AppColors.highStatColor,
                progressColor: AppColors.lowStatColor,
                maxValue: maxProgressBarValue.toDouble(),
              ),
            )
          ],
        ),
      );
}
