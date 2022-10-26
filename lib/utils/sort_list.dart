import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/utils/enums.dart';

List<Pokemon> sortList(SortType sortType, List<Pokemon> itemList) {
  List<Pokemon>? list = itemList;
  switch (sortType) {
    case SortType.id:
      list.sort((a, b) => a.id!.compareTo(b.id!));
      return list;
    case SortType.name:
      list.sort((a, b) => a.name!.compareTo(b.name!));
      return list;
    case SortType.height:
      list.sort((a, b) => a.height!.compareTo(b.height!));
      return list;
    case SortType.weight:
      list.sort((a, b) => a.weight!.compareTo(b.weight!));
      return list;
  }
}
