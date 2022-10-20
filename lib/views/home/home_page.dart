import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/models/pagination.dart';
import 'package:pokedex/models/pokemon/pokemon.dart' hide Icons;
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/views/pokedex/pokedex_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final HomeController homeController = HomeController();
  final PagingController<String, Pokemon> _pagingController =
      PagingController(firstPageKey: '');
  late TabController _tabController;
  late int _selectedIndex;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _selectedIndex = 0;

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });

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
        _pagingController.appendPage(newItems, homeController.nextPage);
      }
    });
    super.initState();
  }

  String get title {
    switch (_selectedIndex) {
      case 0:
        return 'Pokedex';
      case 1:
        return 'Favourites';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.navbarColor,
          selectedItemColor: _selectedIndex == 0
              ? AppColors.tabPokedexColor
              : AppColors.tabFavouritesColor,
          unselectedItemColor: AppColors.unselectedItemColor,
          unselectedFontSize: 14,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (value) => setState(() {
            _selectedIndex = value;
            _tabController.index = value;
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
              label: 'Favourites',
              activeIcon: SvgPicture.asset(
                'assets/icons/heart.svg',
                height: 24,
                color: AppColors.tabFavouritesColor,
              ),
              icon: SvgPicture.asset(
                'assets/icons/heart.svg',
                height: 24,
                color: AppColors.unselectedItemColor,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.searchButtonColor,
          child: const Icon(Icons.search),
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
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  expandedHeight: 150.0,
                  backgroundColor: Colors.transparent,
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
                ),
              ],
              body: TabBarView(
                controller: _tabController,
                children: [
                  PokedexPage(pagingController: _pagingController),
                  Container(),
                ],
              ),
            )
          ],
        ),
      );

  @override
  void dispose() {
    _tabController.dispose();
    _pagingController.dispose();
    super.dispose();
  }
}
