import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:rxdart/subjects.dart';

class StreamManager {
  StreamManager._internal();
  static final StreamManager _instance = StreamManager._internal();
  static StreamManager get instance => _instance;

  final BehaviorSubject<bool> _appIsBusy = BehaviorSubject<bool>();
  final BehaviorSubject<List<Pokemon>> _pokemonList =
      BehaviorSubject<List<Pokemon>>();

  void appIsBusy(bool state) {
    _appIsBusy.sink.add(state);
  }

  void setPokemonList(List<Pokemon> list) {
    _pokemonList.sink.add(list);
  }

  Stream<bool> get appIsBusyStream => _appIsBusy.stream;
  Stream<List<Pokemon>> get pokemonListStream => _pokemonList.stream;
}
