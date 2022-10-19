import 'package:pokedex/models/pokemon_list/result.dart';

class PokemonListResponse {
  PokemonListResponse({
    required this.count,
    required this.next,
    required this.previous,
    this.results = const <Result>[],
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      PokemonListResponse(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results:
            List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
