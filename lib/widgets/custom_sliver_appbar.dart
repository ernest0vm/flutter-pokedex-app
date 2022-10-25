import 'package:flutter/material.dart';
import 'package:pokedex/styles/app_colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 150.0,
        backgroundColor: Colors.transparent,
        actions: actions,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: false,
        ),
      );
}
