import 'package:flutter/material.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/views/home/widgets/search_modal.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool _hasSearchActive = false;
  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () async {
          setState(() {
            _hasSearchActive = !_hasSearchActive;
          });

          if (_hasSearchActive) {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => SearchModal(
                onChange: (value) {
                  // searchPokemon(value);
                },
              ),
            );
          } else {
            // _pagingController.refresh();
          }
        },
        backgroundColor: _hasSearchActive
            ? AppColors.femaleIconColor
            : AppColors.searchButtonColor,
        child: _hasSearchActive
            ? const Icon(Icons.close)
            : const Icon(Icons.search),
      );
}
