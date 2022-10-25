class Pokemon {
  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
    this.image,
  });
  late final List<Abilities> abilities;
  late final int baseExperience;
  late final List<Forms> forms;
  late final List<GameIndices> gameIndices;
  late final int height;
  late final List<dynamic> heldItems;
  late final int id;
  late final bool isDefault;
  late final String locationAreaEncounters;
  late final List<Moves> moves;
  late final String name;
  late final int order;
  late final List<dynamic> pastTypes;
  late final Species species;
  late final List<Stats> stats;
  late final List<Types> types;
  late final int weight;
  String? image;

  Pokemon.fromJson(Map<String, dynamic> json) {
    abilities =
        List.from(json['abilities']).map((e) => Abilities.fromJson(e)).toList();
    baseExperience = json['base_experience'];
    forms = List.from(json['forms']).map((e) => Forms.fromJson(e)).toList();
    gameIndices = List.from(json['game_indices'])
        .map((e) => GameIndices.fromJson(e))
        .toList();
    height = json['height'];
    heldItems = List.castFrom<dynamic, dynamic>(json['held_items']);
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    moves = List.from(json['moves']).map((e) => Moves.fromJson(e)).toList();
    name = json['name'];
    order = json['order'];
    pastTypes = List.castFrom<dynamic, dynamic>(json['past_types']);
    species = Species.fromJson(json['species']);
    stats = List.from(json['stats']).map((e) => Stats.fromJson(e)).toList();
    types = List.from(json['types']).map((e) => Types.fromJson(e)).toList();
    weight = json['weight'];
    image =
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id.toString().padLeft(3, '0')}.png';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['abilities'] = abilities.map((e) => e.toJson()).toList();
    data['base_experience'] = baseExperience;
    data['forms'] = forms.map((e) => e.toJson()).toList();
    data['game_indices'] = gameIndices.map((e) => e.toJson()).toList();
    data['height'] = height;
    data['held_items'] = heldItems;
    data['id'] = id;
    data['is_default'] = isDefault;
    data['location_area_encounters'] = locationAreaEncounters;
    data['moves'] = moves.map((e) => e.toJson()).toList();
    data['name'] = name;
    data['order'] = order;
    data['past_types'] = pastTypes;
    data['species'] = species.toJson();
    data['stats'] = stats.map((e) => e.toJson()).toList();
    data['types'] = types.map((e) => e.toJson()).toList();
    data['weight'] = weight;
    return data;
  }
}

class Abilities {
  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
  late final Ability ability;
  late final bool isHidden;
  late final int slot;

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = Ability.fromJson(json['ability']);
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ability'] = ability.toJson();
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    return data;
  }
}

class Ability {
  Ability({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Forms {
  Forms({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Forms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class GameIndices {
  GameIndices({
    required this.gameIndex,
    required this.version,
  });
  late final int gameIndex;
  late final Version version;

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['game_index'] = gameIndex;
    data['version'] = version.toJson();
    return data;
  }
}

class Version {
  Version({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Moves {
  Moves({
    required this.move,
    required this.versionGroupDetails,
  });
  late final Move move;
  late final List<VersionGroupDetails> versionGroupDetails;

  Moves.fromJson(Map<String, dynamic> json) {
    move = Move.fromJson(json['move']);
    versionGroupDetails = List.from(json['version_group_details'])
        .map((e) => VersionGroupDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['move'] = move.toJson();
    data['version_group_details'] =
        versionGroupDetails.map((e) => e.toJson()).toList();
    return data;
  }
}

class Move {
  Move({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class VersionGroupDetails {
  VersionGroupDetails({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });
  late final int levelLearnedAt;
  late final MoveLearnMethod moveLearnMethod;
  late final VersionGroup versionGroup;

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = MoveLearnMethod.fromJson(json['move_learn_method']);
    versionGroup = VersionGroup.fromJson(json['version_group']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['level_learned_at'] = levelLearnedAt;
    data['move_learn_method'] = moveLearnMethod.toJson();
    data['version_group'] = versionGroup.toJson();
    return data;
  }
}

class MoveLearnMethod {
  MoveLearnMethod({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class VersionGroup {
  VersionGroup({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  VersionGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Species {
  Species({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Home {
  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final String frontDefault;
  late final dynamic frontFemale;
  late final String frontShiny;
  late final dynamic frontShinyFemale;

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = null;
    frontShiny = json['front_shiny'];
    frontShinyFemale = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class Officialartwork {
  Officialartwork({
    required this.frontDefault,
  });
  late final String frontDefault;

  Officialartwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    return data;
  }
}

class Animated {
  Animated({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final String backDefault;
  late final dynamic backFemale;
  late final String backShiny;
  late final dynamic backShinyFemale;
  late final String frontDefault;
  late final dynamic frontFemale;
  late final String frontShiny;
  late final dynamic frontShinyFemale;

  Animated.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = null;
    backShiny = json['back_shiny'];
    backShinyFemale = null;
    frontDefault = json['front_default'];
    frontFemale = null;
    frontShiny = json['front_shiny'];
    frontShinyFemale = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class Icons {
  Icons({
    required this.frontDefault,
    this.frontFemale,
  });
  late final String frontDefault;
  late final dynamic frontFemale;

  Icons.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    return data;
  }
}

class Stats {
  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
  late final int baseStat;
  late final int effort;
  late final Stat stat;

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    data['stat'] = stat.toJson();
    return data;
  }
}

class Stat {
  Stat({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Types {
  Types({
    required this.slot,
    required this.type,
  });
  late final int slot;
  late final Type type;

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['slot'] = slot;
    data['type'] = type.toJson();
    return data;
  }
}

class Type {
  Type({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
