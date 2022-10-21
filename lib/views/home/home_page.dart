import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/managers/favorites_manager.dart';
import 'package:pokedex/models/pagination.dart';
import 'package:pokedex/models/pokemon/pokemon.dart' hide Icons;
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/enums.dart';
import 'package:pokedex/views/favorites/favorites_page.dart';
import 'package:pokedex/views/home/widgets/search_modal.dart';
import 'package:pokedex/views/home/widgets/sort_list_tile.dart';
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

    FavoritesManager.instance.getFavoritePokemonList();

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
        return 'Favorites';
      default:
        return '';
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

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: Container(
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
                        color: AppColors.midBlackTextColor),
                  ),
                  const SizedBox(height: 20),
                  SortListTile(
                      iconData: Icons.format_list_numbered,
                      text: 'Pokemon id',
                      onTap: () => sortBy(SortType.id)),
                  SortListTile(
                      iconData: Icons.abc,
                      text: 'Name',
                      onTap: () => sortBy(SortType.name)),
                  SortListTile(
                      iconData: Icons.panorama_vertical,
                      text: 'Height',
                      onTap: () => sortBy(SortType.height)),
                  SortListTile(
                      iconData: Icons.panorama_horizontal,
                      text: 'Weight',
                      onTap: () => sortBy(SortType.weight)),
                ],
              ),
            ),
          )),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        ),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) => const SearchModal(),
                  );
                },
                backgroundColor: AppColors.searchButtonColor,
                child: const Icon(Icons.search),
              )
            : null,
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
                    )
                  ],
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
                  const FavoritesPage(),
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
