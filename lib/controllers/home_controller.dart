import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/managers/api_manager.dart';
import 'package:pokedex/models/api_response.dart';
import 'package:pokedex/models/pagination.dart';
import 'package:pokedex/models/pokemon_list/pokemon_list_response.dart';
import 'package:pokedex/models/pokemon_list/result.dart';

class HomeController {
  int _itemCount = 0;
  String _nextPage = '';

  int get itemCount => _itemCount;
  String get nextPage => _nextPage;

  Future<List<Pokemon>> fetchPokemonList({
    Pagination? pagination,
    bool showLoader = false,
  }) async {
    late String limit;
    late String offset;
    if (pagination != null) {
      limit = pagination.limit.toString();
      offset = pagination.offset.toString();
    }
    ApiResponse apiResponse = await ApiManager.instance.getPokemonList(
      limit: limit,
      offset: offset,
      showLoader: showLoader,
    );
    if (apiResponse.hasData) {
      PokemonListResponse pokemonListResponse =
          PokemonListResponse.fromJson(apiResponse.data);

      _itemCount = pokemonListResponse.count;
      _nextPage = pokemonListResponse.next!;

      List<Pokemon> pokemonList = <Pokemon>[];
      for (Result result in pokemonListResponse.results) {
        List<String> url = result.url.split('/');
        String pokeId = url.elementAt(url.length - 2);
        Pokemon? pokemon = await fetchPokemon(pokeId);
        if (pokemon != null) {
          pokemonList.add(pokemon);
        }
      }

      return pokemonList;
    }

    return <Pokemon>[];
  }

  Future<Pokemon?> fetchPokemon(String pokeId,
      {bool showLoader = false}) async {
    ApiResponse apiResponse = await ApiManager.instance.getPokemon(
      pokeId,
      showLoader: showLoader,
    );
    if (apiResponse.hasData) {
      Pokemon pokemon = Pokemon.fromJson(apiResponse.data);
      return pokemon;
    }

    return null;
  }
}
