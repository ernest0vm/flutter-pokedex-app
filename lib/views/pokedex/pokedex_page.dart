import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/managers/session_manager.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/views/pokedex/widgets/end_drawer.dart';
import 'package:pokedex/views/pokedex/widgets/search_button.dart';
import 'package:pokedex/widgets/custom_sliver_appbar.dart';
import 'package:pokedex/widgets/empty_pokemon_list.dart';
import 'package:pokedex/widgets/loader.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final HomeController homeController = HomeController();

  @override
  void initState() {
    SessionManager.instance.pagingController
        .addPageRequestListener(homeController.requestMorePokemons);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer: const EndDrawer(),
        floatingActionButton: const SearchButton(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomSliverAppBar(
              title: 'Pokedex',
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.sort,
                      size: 36,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PagedGridView<String, Pokemon>(
              padding: EdgeInsets.zero,
              showNewPageProgressIndicatorAsGridChild: false,
              showNewPageErrorIndicatorAsGridChild: false,
              showNoMoreItemsIndicatorAsGridChild: false,
              pagingController: SessionManager.instance.pagingController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                itemBuilder: (context, item, index) =>
                    PokemonCard(pokemon: item),
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
                noItemsFoundIndicatorBuilder: (context) => const Center(
                  child: EmptyPokemonList(
                    size: Size(250, 250),
                    message: 'No pokemon here!',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
