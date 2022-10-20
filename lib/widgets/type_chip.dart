import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/utils/extensions.dart';

class TypeChip extends StatelessWidget {
  const TypeChip(
      {Key? key,
      required this.type,
      this.padding = const EdgeInsets.symmetric(vertical: 5)})
      : super(key: key);

  final Type type;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Material(
          type: MaterialType.card,
          color: Colors.white.withOpacity(0.4),
          shape: const StadiumBorder(),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 50,
              minHeight: 16,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                type.name.capitalize!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
}
