import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/managers/api_manager.dart';
import 'package:pokedex/managers/session_manager.dart';
import 'package:pokedex/managers/stream_manager.dart';
import 'package:pokedex/models/api_response.dart';
import 'package:pokedex/models/pagination.dart';
import 'package:pokedex/models/pokemon_list/pokemon_list_response.dart';
import 'package:pokedex/models/pokemon_list/result.dart';

class HomeController {
  Future<List<Pokemon>> fetchPokemonList({
    Pagination? pagination,
    bool showLoader = false,
  }) async {
    late String? limit;
    late String? offset;
    late ApiResponse apiResponse;
    if (pagination != null) {
      limit = pagination.limit.toString();
      offset = pagination.offset.toString();
      apiResponse = await ApiManager.instance.getPokemonList(
        limit: limit,
        offset: offset,
        showLoader: showLoader,
      );
    } else {
      apiResponse = await ApiManager.instance.getPokemonList(
        showLoader: showLoader,
      );
    }

    if (apiResponse.hasData) {
      PokemonListResponse pokemonListResponse =
          PokemonListResponse.fromJson(apiResponse.data);

      SessionManager.instance.itemCount = pokemonListResponse.count;
      SessionManager.instance.nextPage = pokemonListResponse.next!;

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

  void requestMorePokemons(String pageKey) async {
    Uri? nextUri = Uri.tryParse(pageKey);
    late List<Pokemon> pokemonList;

    if (nextUri != null && nextUri.queryParameters.isNotEmpty) {
      pokemonList = await fetchPokemonList(
        pagination: Pagination(
          offset: int.parse(nextUri.queryParameters['offset']!),
          limit: int.parse(nextUri.queryParameters['limit']!),
        ),
      );
    } else {
      pokemonList = await fetchPokemonList();
    }

    final previouslyFetchedItemsCount =
        SessionManager.instance.pagingController.itemList!.length;

    final isLastPage =
        previouslyFetchedItemsCount >= SessionManager.instance.itemCount;
    final newItems = pokemonList;

    if (isLastPage) {
      SessionManager.instance.pagingController.appendLastPage(newItems);
    } else {
      SessionManager.instance.pagingController.appendPage(
        newItems,
        SessionManager.instance.nextPage,
      );
    }
  }
}
