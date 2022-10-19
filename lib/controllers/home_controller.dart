import 'package:pokedex/managers/api_manager.dart';
import 'package:pokedex/managers/stream_manager.dart';
import 'package:pokedex/models/api_response.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/models/pokemon_list/pokemon_list_response.dart';
import 'package:pokedex/models/pokemon_list/result.dart';

class HomeController {
  Future<bool> fetchPokemonList({int limit = 25, int offset = 0}) async {
    ApiResponse apiResponse =
        await ApiManager.instance.getPokemonList(limit, offset);
    if (apiResponse.hasData) {
      PokemonListResponse pokemonListResponse =
          PokemonListResponse.fromJson(apiResponse.data);

      List<Pokemon> pokemonList = <Pokemon>[];
      for (Result result in pokemonListResponse.results) {
        List<String> url = result.url.split('/');
        String pokeId = url.elementAt(url.length - 2);
        Pokemon? pokemon = await fetchPokemon(pokeId);
        if (pokemon != null) {
          pokemonList.add(pokemon);
        }
        StreamManager.instance.setPokemonList(pokemonList);
      }
      return true;
    }

    return false;
  }

  Future<Pokemon?> fetchPokemon(String pokeId) async {
    ApiResponse apiResponse = await ApiManager.instance.getPokemon(pokeId);
    if (apiResponse.hasData) {
      Pokemon pokemon = Pokemon.fromJson(apiResponse.data);
      return pokemon;
    }

    return null;
  }
}
