import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapi/model/evolution/evolution-chain.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/styles/app_colors.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/views/pokemon_detail/widgets/tab_about.dart';
import 'package:pokedex/views/pokemon_detail/widgets/tab_evolution.dart';
import 'package:pokedex/views/pokemon_detail/widgets/tab_moves.dart';
import 'package:pokedex/views/pokemon_detail/widgets/tab_stats.dart';
import 'package:pokedex/widgets/fav_button.dart';
import 'package:pokedex/widgets/loader.dart';
import 'package:pokedex/widgets/type_chip.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({
    Key? key,
    required this.pokemon,
    required this.backgroundGradient,
  }) : super(key: key);

  final Pokemon pokemon;
  final LinearGradient backgroundGradient;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(gradient: widget.backgroundGradient),
              ),
            ),
            Positioned(
              top: 10,
              right: 100,
              child: SvgPicture.asset('assets/icons/dots.svg'),
            ),
            Positioned(
              top: -40,
              left: -50,
              child: Transform.rotate(
                angle: 75,
                child: Container(
                  constraints:
                      const BoxConstraints(minHeight: 150, minWidth: 150),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, 1],
                      colors: [Colors.white38, Colors.white10],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 150.0,
                  backgroundColor: Colors.transparent,
                  actions: [
                    FavButton(pokeId: widget.pokemon.id!),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: List.generate(
                          widget.pokemon.types!.length,
                          (index) => Transform.scale(
                            scale: 1.2,
                            child: TypeChip(
                              typeName:
                                  widget.pokemon.types![index].type!.name!,
                              padding: const EdgeInsets.only(right: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(left: 10, bottom: 30),
                    title: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              widget.pokemon.name!.capitalize!,
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
                            '#${widget.pokemon.id.toString().padLeft(3, '0')}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: DefaultTabController(
                            length: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TabBar(
                                  labelColor: AppColors.blackTextColor,
                                  indicatorColor: AppColors.tabIndicatorColor,
                                  indicatorWeight: 3,
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
                                Expanded(
                                  child: FutureBuilder<PokemonSpecie?>(
                                      future: PokeAPI.getObject<PokemonSpecie>(
                                          widget.pokemon.id!),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          List<String> url = snapshot
                                              .data!.evolutionChain!.url!
                                              .split('/');
                                          String evolutionId =
                                              url.elementAt(url.length - 2);
                                          return TabBarView(
                                            children: [
                                              TabAbout(
                                                pokemon: widget.pokemon,
                                                pokemonSpecie: snapshot.data!,
                                              ),
                                              TabStats(pokemon: widget.pokemon),
                                              FutureBuilder(
                                                  future: PokeAPI.getObject<
                                                      EvolutionChain>(
                                                    int.parse(evolutionId),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      return TabEvolution(
                                                        evolutionChain:
                                                            snapshot.data!,
                                                      );
                                                    }

                                                    return const Center(
                                                      child: Loader(size: 80),
                                                    );
                                                  }),
                                              TabMoves(pokemon: widget.pokemon),
                                            ],
                                          );
                                        }
                                        return const Center(
                                          child: Loader(size: 80),
                                        );
                                      }),
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
                              child: Hero(
                                tag: widget.pokemon.name!,
                                child: CachedNetworkImage(
                                  imageUrl: widget.pokemon.getImageUrl,
                                  width: 200,
                                  fit: BoxFit.fitHeight,
                                ),
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
