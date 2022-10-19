import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  const FavButton({Key? key}) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite_outline,
          color: Colors.white,
        ),
      );
}
