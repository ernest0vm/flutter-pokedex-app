import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:rxdart/subjects.dart';

class StreamManager {
  StreamManager._internal();
  static final StreamManager _instance = StreamManager._internal();
  static StreamManager get instance => _instance;

  final BehaviorSubject<bool> _appIsBusy = BehaviorSubject<bool>();
  final BehaviorSubject<List<Pokemon>> _pokemonList =
      BehaviorSubject<List<Pokemon>>();
  final BehaviorSubject<PagingState<String, Pokemon>> _pagingState =
      BehaviorSubject<PagingState<String, Pokemon>>();

  void appIsBusy(bool state) {
    _appIsBusy.sink.add(state);
  }

  void setPokemonList(List<Pokemon> list) {
    _pokemonList.sink.add(list);
  }

  void setPagingState(PagingState<String, Pokemon> state) {
    _pagingState.sink.add(state);
  }

  Stream<bool> get appIsBusyStream => _appIsBusy.stream;
  Stream<List<Pokemon>> get pokemonListStream => _pokemonList.stream;
  Stream<PagingState<String, Pokemon>> get pagingStateStream =>
      _pagingState.stream;
}
