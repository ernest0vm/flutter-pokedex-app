import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/styles/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  Color getItemColor() {
    switch (_selectedIndex) {
      case 0:
        return const Color(0xffFFCE4B);
      case 1:
        return const Color(0xffFF5B5B);
      default:
        return AppColors.unselectedItemColor;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navbarColor,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        selectedItemColor: getItemColor(),
        unselectedItemColor: AppColors.unselectedItemColor,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
            label: 'Pokedex',
            icon: SvgPicture.asset(
              'assets/icons/pikachu.svg',
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favourites',
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              height: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(
              'assets/icons/pokeball.svg',
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 150.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 20),
                  title: Text(
                    'Pokedex',
                    style: TextStyle(
                      color: AppColors.blackTextColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  centerTitle: false,
                ),
              ),
            ],
          ),
        ],
      ));
}
