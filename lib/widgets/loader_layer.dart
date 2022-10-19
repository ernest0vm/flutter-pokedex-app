import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/widgets/loader.dart';

class LoaderLayer extends StatelessWidget {
  const LoaderLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const Center(
            child: Loader(size: 150),
          ),
        ),
      );
}
