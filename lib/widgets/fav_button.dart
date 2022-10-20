import 'package:flutter/material.dart';
import 'package:pokedex/managers/favorites_manager.dart';
import 'package:pokedex/styles/app_colors.dart';

class FavButton extends StatefulWidget {
  const FavButton({Key? key, required this.pokeId}) : super(key: key);

  final int pokeId;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  late bool _isFavorite;

  @override
  void initState() {
    // _isFavorite = FavoritesManager.instance.isFavorite(widget.pokeId);
    _isFavorite = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          setState(() {
            _isFavorite = !_isFavorite;
          });

          if (_isFavorite) {
            FavoritesManager.instance.addFavoritePokemon(widget.pokeId);
          } else {
            FavoritesManager.instance.removeFavoritePokemon(widget.pokeId);
          }
        },
        icon: _isFavorite
            ? Icon(
                Icons.favorite,
                color: AppColors.tabFavoritesColor.withOpacity(0.8),
              )
            : const Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
      );
}
