import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/styles/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        backgroundColor: AppColors.navbarColor,
        selectedItemColor: _selectedIndex == 0
            ? AppColors.tabPokedexColor
            : AppColors.tabFavoritesColor,
        unselectedItemColor: AppColors.unselectedItemColor,
        unselectedFontSize: 14,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
            label: 'Pokedex',
            activeIcon: SvgPicture.asset(
              'assets/icons/pikachu.svg',
              height: 30,
              color: AppColors.tabPokedexColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/pikachu.svg',
              height: 30,
              color: AppColors.unselectedItemColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            activeIcon: SvgPicture.asset(
              'assets/icons/heart.svg',
              height: 24,
              color: AppColors.tabFavoritesColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              height: 24,
              color: AppColors.unselectedItemColor,
            ),
          ),
        ],
      );
}
