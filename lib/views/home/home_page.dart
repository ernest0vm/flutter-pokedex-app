import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/managers/favorites_manager.dart';
import 'package:pokedex/models/pagination.dart';
import 'package:pokedex/models/pokemon/pokemon.dart' hide Icons;
import 'package:pokedex/utils/enums.dart';
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
  final PagingController<String, Pokemon> _pagingController =
      PagingController(firstPageKey: '');

  @override
  void initState() {
    FavoritesManager.instance.getFavoritePokemonList();

    _pagingController.addPageRequestListener(requestPokemons);
    super.initState();
  }

  Future<void> requestPokemons(pageKey) async {
    Uri nextUri = Uri.parse(pageKey);
    List<Pokemon> pokemonList = await homeController.fetchPokemonList(
        pagination: Pagination(
      offset: int.parse(nextUri.queryParameters['offset'] ?? '0'),
      limit: int.parse(nextUri.queryParameters['limit'] ?? '25'),
    ));

    final previouslyFetchedItemsCount = _pagingController.itemList?.length ?? 0;

    final isLastPage = previouslyFetchedItemsCount >= homeController.itemCount;
    final newItems = pokemonList;

    if (isLastPage) {
      _pagingController.appendLastPage(newItems);
    } else {
      _pagingController.appendPage(newItems, homeController.nextPage);
    }
  }

  void sortBy(SortType type) {
    List<Pokemon>? list = _pagingController.itemList!;
    switch (type) {
      case SortType.id:
        list.sort((a, b) => a.id.compareTo(b.id));
        setState(() {
          _pagingController.value = PagingState(itemList: list);
        });
        break;
      case SortType.name:
        list.sort((a, b) => a.name.compareTo(b.name));
        setState(() {
          _pagingController.value = PagingState(itemList: list);
        });
        break;
      case SortType.height:
        list.sort((a, b) => a.height.compareTo(b.height));
        setState(() {
          _pagingController.value = PagingState(itemList: list);
        });
        break;
      case SortType.weight:
        list.sort((a, b) => a.weight.compareTo(b.weight));
        setState(() {
          _pagingController.value = PagingState(itemList: list);
        });
        break;
    }
    Navigator.of(context).pop();
  }

  void searchPokemon(String value) async {
    int? id = int.tryParse(value);

    if (id != null) {
      Pokemon? pokemon = await homeController.fetchPokemon(id.toString());
      if (pokemon != null) {
        setState(() {
          _pagingController.value = PagingState(itemList: [pokemon]);
        });
      }
    } else {
      try {
        List<Pokemon> pokemon = _pagingController.itemList!
            .where((element) => element.name.contains(value))
            .toList();

        setState(() {
          _pagingController.value = PagingState(itemList: pokemon);
        });
      } catch (e) {
        // no pokemon finded
      }
    }
  }

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
            DefaultTabController(
              length: 2,
              child: TabBarView(
                children: [
                  PokedexPage(pagingController: _pagingController),
                  const FavoritesPage(),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
