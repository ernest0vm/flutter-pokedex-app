import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/extensions.dart';

class EmptyPokemonList extends StatefulWidget {
  const EmptyPokemonList({
    Key? key,
    this.size = const Size(150, 150),
    this.message,
  }) : super(key: key);

  final Size size;
  final String? message;

  @override
  State<EmptyPokemonList> createState() => _EmptyPokemonListState();
}

class _EmptyPokemonListState extends State<EmptyPokemonList> {
  late Pokemon pokemon;

  @override
  void initState() {
    pokemon = Pokemon(id: math.Random().nextInt(150));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: pokemon.getImageUrl,
            width: widget.size.width,
            height: widget.size.height,
            fit: BoxFit.fitWidth,
            color: AppColors.unselectedItemColor,
          ),
          if (widget.message != null)
            Text(
              widget.message!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.midBlackTextColor,
              ),
            ),
        ],
      );
}
