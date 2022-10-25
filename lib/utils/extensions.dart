import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/utils/utils.dart';

extension StringExtensions on String {
  /// Capitalize the String
  String? get capitalize => Utils.capitalize(this);

  /// Capitalize the first letter of the String
  String? get capitalizeFirst => Utils.capitalizeFirst(this);
}

extension PokemonExtensions on Pokemon {
  /// Get pokemon image
  String get getImageUrl =>
      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id.toString().padLeft(3, '0')}.png';
}
