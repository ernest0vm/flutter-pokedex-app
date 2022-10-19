import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon/pokemon.dart' hide Icons;
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/widgets/fav_button.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({
    Key? key,
    required this.pokemon,
    required this.backgroundGradient,
  }) : super(key: key);

  final Pokemon pokemon;
  final LinearGradient backgroundGradient;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(gradient: backgroundGradient),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 150.0,
                  backgroundColor: Colors.transparent,
                  actions: const [FavButton()],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: List.generate(
                          pokemon.types.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: Chip(
                              backgroundColor: Colors.white30,
                              padding: const EdgeInsets.all(1),
                              label: Text(
                                pokemon.types[index].type.name,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(left: 20, bottom: 45),
                    title: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              pokemon.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            '#${pokemon.id.toString().padLeft(3, '0')}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    centerTitle: false,
                  ),
                ),
                SliverFillRemaining(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 160,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: DefaultTabController(
                            length: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TabBar(
                                  labelColor: AppColors.blackTextColor,
                                  unselectedLabelColor:
                                      AppColors.unselectedItemColor,
                                  padding: const EdgeInsets.only(
                                      top: 35, bottom: 20),
                                  tabs: const [
                                    Tab(
                                      text: 'About',
                                    ),
                                    Tab(
                                      text: 'Base Stats',
                                    ),
                                    Tab(
                                      text: 'Evolution',
                                    ),
                                    Tab(
                                      text: 'Moves',
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      100, //I want to use dynamic height instead of fixed height
                                  child: TabBarView(
                                    children: [
                                      Container(),
                                      Container(),
                                      Container(),
                                      Container(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                'assets/icons/pokeball-bg.svg',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            SizedBox(
                              height: 200.0,
                              child: Image.network(
                                pokemon.image!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
