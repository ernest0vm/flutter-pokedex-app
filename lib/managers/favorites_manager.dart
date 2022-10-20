import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/utils/constants.dart';

class FavoritesManager {
  FavoritesManager._internal();
  static final FavoritesManager _instance = FavoritesManager._internal();
  static FavoritesManager get instance => _instance;

  late Box _box;

  Future<void> init() async {
    _box = await Hive.openBox(Constants.hiveFavoritesDB);
  }

  void setIsFavorite(int pokeId, bool value) {
    _box.put(pokeId, value);
  }

  bool isFavorite(int pokeId, {bool defaultValue = false}) =>
      _box.get(pokeId, defaultValue: defaultValue);
}
