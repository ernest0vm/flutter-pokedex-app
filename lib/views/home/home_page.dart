import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/managers/favorites_manager.dart';
import 'package:pokedex/views/favorites/favorites_page.dart';
import 'package:pokedex/views/home/widgets/bottom_navbar.dart';
import 'package:pokedex/views/pokedex/pokedex_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = HomeController();

  @override
  void initState() {
    FavoritesManager.instance.getFavoritePokemonList();
    super.initState();
  }

  // void searchPokemon(String value) async {
  //   int? id = int.tryParse(value);

  //   if (id != null) {
  //     Pokemon? pokemon = await homeController.fetchPokemon(id.toString());
  //     if (pokemon != null) {
  //       setState(() {
  //         _pagingController.value = PagingState(itemList: [pokemon]);
  //       });
  //     }
  //   } else {
  //     try {
  //       List<Pokemon> pokemon = _pagingController.itemList!
  //           .where((element) => element.name!.contains(value))
  //           .toList();

  //       setState(() {
  //         _pagingController.value = PagingState(itemList: pokemon);
  //       });
  //     } catch (e) {
  //       // no pokemon finded
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: const BottomNavBar(),
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
            const DefaultTabController(
              length: 2,
              child: TabBarView(
                children: [
                  PokedexPage(),
                  FavoritesPage(),
                ],
              ),
            ),
          ],
        ),
      );
}
