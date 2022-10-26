import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

class SessionManager {
  SessionManager._internal();
  static final SessionManager _instance = SessionManager._internal();
  static SessionManager get instance => _instance;

  int itemCount = 0;
  String nextPage = '';
  PagingController<String, Pokemon> pagingController =
      PagingController<String, Pokemon>(firstPageKey: '');
}
