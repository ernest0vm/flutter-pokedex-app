import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.margin = const EdgeInsets.symmetric(horizontal: 28),
  }) : super(key: key);

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        margin: margin,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          children: [
            const Icon(Icons.search, size: 26),
            const SizedBox(height: 13),
            Expanded(
              child: TextFormField(
                onFieldSubmitted: ((value) => Navigator.of(context).pop()),
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Search Pokemon, Move, Ability etc',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    // color: AppColors.midBlackTextColor,
                    height: 1,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
}
