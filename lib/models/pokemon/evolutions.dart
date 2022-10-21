class Evolutions {
  Evolutions({
    this.pokeId,
    this.speciesName,
    this.minLevel,
    this.triggerName,
    this.item,
  });

  int? pokeId;
  String? speciesName;
  int? minLevel;
  String? triggerName;
  dynamic item;

  String get image =>
      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${pokeId.toString().padLeft(3, '0')}.png';

  @override
  String toString() =>
      '{pokeId: $pokeId, speciesName: $speciesName, minLevel: $minLevel, item: $item, triggerName: $triggerName}';
}
