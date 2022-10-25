import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class FavoritesManager {
  FavoritesManager._internal();
  static final FavoritesManager _instance = FavoritesManager._internal();
  static FavoritesManager get instance => _instance;

  late Box _box;
  final BehaviorSubject<List<Pokemon>> _favoritePokemonList =
      BehaviorSubject<List<Pokemon>>();
  final HomeController homeController = HomeController();

  Future<void> init() async {
    _box = await Hive.openBox(Constants.hiveFavoritesDB);
  }

  bool isFavorite(int pokeId) {
    List<int> pokeIdList =
        _box.get(Constants.favoritesListKey, defaultValue: <int>[]);

    return pokeIdList.contains(pokeId);
  }

  void _setFavoritePokemonList(List<Pokemon> list) {
    _favoritePokemonList.sink.add(list);
  }

  Future<void> getFavoritePokemonList() async {
    List<int> pokeIdList =
        _box.get(Constants.favoritesListKey, defaultValue: <int>[]);
    List<Pokemon> pokemonList = <Pokemon>[];
    for (int pokeId in pokeIdList) {
      Pokemon? pokemon = await homeController.fetchPokemon(pokeId.toString());
      if (pokemon != null) {
        pokemonList.add(pokemon);
      }
    }
    _setFavoritePokemonList(pokemonList);
  }

  void addFavoritePokemon(int pokeId) {
    List<int> pokeIdList =
        _box.get(Constants.favoritesListKey, defaultValue: <int>[]);

    if (!pokeIdList.contains(pokeId)) {
      pokeIdList.add(pokeId);
    }

    _box.put(Constants.favoritesListKey, pokeIdList);
    getFavoritePokemonList();
  }

  void removeFavoritePokemon(int pokeId) {
    List<int> pokeIdList =
        _box.get(Constants.favoritesListKey, defaultValue: <int>[]);

    if (pokeIdList.contains(pokeId)) {
      pokeIdList.remove(pokeId);
    }

    _box.put(Constants.favoritesListKey, pokeIdList);
    getFavoritePokemonList();
  }

  Stream<List<Pokemon>> get favoritePokemonListStream =>
      _favoritePokemonList.stream;
}
