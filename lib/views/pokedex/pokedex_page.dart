import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/models/pagination.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/widgets/loader.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final PagingController<String, Pokemon> _pagingController =
      PagingController(firstPageKey: '');
  final HomeController homeController = HomeController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) async {
      Uri nextUri = Uri.parse(pageKey);
      List<Pokemon> pokemonList = await homeController.fetchPokemonList(
          pagination: Pagination(
        offset: int.parse(nextUri.queryParameters['offset'] ?? '0'),
        limit: int.parse(nextUri.queryParameters['limit'] ?? '25'),
      ));

      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      final isLastPage =
          previouslyFetchedItemsCount >= homeController.itemCount;
      final newItems = pokemonList;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        _pagingController.appendPage(newItems, pageKey);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: PagedSliverGrid<String, Pokemon>(
          showNewPageProgressIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          pagingController: _pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          builderDelegate: PagedChildBuilderDelegate<Pokemon>(
            itemBuilder: (context, item, index) => PokemonCard(pokemon: item),
            animateTransitions: true,
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Loader(
                  size: 150,
                ),
              ),
            ),
            newPageProgressIndicatorBuilder: (context) => const Padding(
              padding: EdgeInsets.all(20),
              child: Loader(
                size: 30,
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
