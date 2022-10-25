import 'package:flutter/material.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/views/home/widgets/sort_list_tile.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.4,
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sort pokemon by:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.midBlackTextColor,
                  ),
                ),
                const SizedBox(height: 20),
                const SortListTile(
                  iconData: Icons.format_list_numbered,
                  text: 'Pokemon id',
                  // onTap: () => sortBy(SortType.id)),
                ),
                const SortListTile(
                  iconData: Icons.abc,
                  text: 'Name',
                  // onTap: () => sortBy(SortType.name)),
                ),
                const SortListTile(
                  iconData: Icons.panorama_vertical,
                  text: 'Height',
                  // onTap: () => sortBy(SortType.height)),
                ),
                const SortListTile(
                  iconData: Icons.panorama_horizontal,
                  text: 'Weight',
                  // onTap: () => sortBy(SortType.weight)),
                ),
              ],
            ),
          ),
        )),
      );
}
