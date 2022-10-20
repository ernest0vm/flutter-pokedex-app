import 'package:pokedex/utils/utils.dart';

extension StringExtensions on String {
  /// capitalize the String
  String? get capitalize => Utils.capitalize(this);

  /// Capitalize the first letter of the String
  String? get capitalizeFirst => Utils.capitalizeFirst(this);
}
