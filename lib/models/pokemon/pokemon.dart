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
    required this.sprites,
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
  late final Sprites sprites;
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
    sprites = Sprites.fromJson(json['sprites']);
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
    data['sprites'] = sprites.toJson();
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

class Sprites {
  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    required this.other,
    required this.versions,
  });
  late final String backDefault;
  late final dynamic backFemale;
  late final String backShiny;
  late final dynamic backShinyFemale;
  late final String frontDefault;
  late final dynamic frontFemale;
  late final String frontShiny;
  late final dynamic frontShinyFemale;
  late final Other other;
  late final Versions versions;

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = null;
    backShiny = json['back_shiny'];
    backShinyFemale = null;
    frontDefault = json['front_default'];
    frontFemale = null;
    frontShiny = json['front_shiny'];
    frontShinyFemale = null;
    other = Other.fromJson(json['other']);
    versions = Versions.fromJson(json['versions']);
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
    data['other'] = other.toJson();
    data['versions'] = versions.toJson();
    return data;
  }
}

class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialartwork,
  });
  late final DreamWorld dreamWorld;
  late final Home home;
  late final Officialartwork officialartwork;

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = DreamWorld.fromJson(json['dream_world']);
    home = Home.fromJson(json['home']);
    officialartwork = Officialartwork.fromJson(json['official-artwork']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dream_world'] = dreamWorld.toJson();
    data['home'] = home.toJson();
    data['official-artwork'] = officialartwork.toJson();
    return data;
  }
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });
  late final String frontDefault;
  late final dynamic frontFemale;

  DreamWorld.fromJson(Map<String, dynamic> json) {
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

class Versions {
  Versions({
    required this.generationi,
    required this.generationii,
    required this.generationiii,
    required this.generationiv,
    required this.generationv,
    required this.generationvi,
    required this.generationvii,
    required this.generationviii,
  });
  late final Generationi generationi;
  late final Generationii generationii;
  late final Generationiii generationiii;
  late final Generationiv generationiv;
  late final Generationv generationv;
  late final Generationvi generationvi;
  late final Generationvii generationvii;
  late final Generationviii generationviii;

  Versions.fromJson(Map<String, dynamic> json) {
    generationi = Generationi.fromJson(json['generation-i']);
    generationii = Generationii.fromJson(json['generation-ii']);
    generationiii = Generationiii.fromJson(json['generation-iii']);
    generationiv = Generationiv.fromJson(json['generation-iv']);
    generationv = Generationv.fromJson(json['generation-v']);
    generationvi = Generationvi.fromJson(json['generation-vi']);
    generationvii = Generationvii.fromJson(json['generation-vii']);
    generationviii = Generationviii.fromJson(json['generation-viii']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['generation-i'] = generationi.toJson();
    data['generation-ii'] = generationii.toJson();
    data['generation-iii'] = generationiii.toJson();
    data['generation-iv'] = generationiv.toJson();
    data['generation-v'] = generationv.toJson();
    data['generation-vi'] = generationvi.toJson();
    data['generation-vii'] = generationvii.toJson();
    data['generation-viii'] = generationviii.toJson();
    return data;
  }
}

class Generationi {
  Generationi({
    required this.redblue,
    required this.yellow,
  });
  late final Redblue redblue;
  late final Yellow yellow;

  Generationi.fromJson(Map<String, dynamic> json) {
    redblue = Redblue.fromJson(json['red-blue']);
    yellow = Yellow.fromJson(json['yellow']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['red-blue'] = redblue.toJson();
    data['yellow'] = yellow.toJson();
    return data;
  }
}

class Redblue {
  Redblue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });
  late final String backDefault;
  late final String backGray;
  late final String backTransparent;
  late final String frontDefault;
  late final String frontGray;
  late final String frontTransparent;

  Redblue.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backGray = json['back_gray'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontGray = json['front_gray'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_gray'] = backGray;
    data['back_transparent'] = backTransparent;
    data['front_default'] = frontDefault;
    data['front_gray'] = frontGray;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class Yellow {
  Yellow({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });
  late final String backDefault;
  late final String backGray;
  late final String backTransparent;
  late final String frontDefault;
  late final String frontGray;
  late final String frontTransparent;

  Yellow.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backGray = json['back_gray'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontGray = json['front_gray'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_gray'] = backGray;
    data['back_transparent'] = backTransparent;
    data['front_default'] = frontDefault;
    data['front_gray'] = frontGray;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class Generationii {
  Generationii({
    required this.crystal,
    required this.gold,
    required this.silver,
  });
  late final Crystal crystal;
  late final Gold gold;
  late final Silver silver;

  Generationii.fromJson(Map<String, dynamic> json) {
    crystal = Crystal.fromJson(json['crystal']);
    gold = Gold.fromJson(json['gold']);
    silver = Silver.fromJson(json['silver']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['crystal'] = crystal.toJson();
    data['gold'] = gold.toJson();
    data['silver'] = silver.toJson();
    return data;
  }
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });
  late final String backDefault;
  late final String backShiny;
  late final String backShinyTransparent;
  late final String backTransparent;
  late final String frontDefault;
  late final String frontShiny;
  late final String frontShinyTransparent;
  late final String frontTransparent;

  Crystal.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    backShinyTransparent = json['back_shiny_transparent'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    frontShinyTransparent = json['front_shiny_transparent'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['back_shiny_transparent'] = backShinyTransparent;
    data['back_transparent'] = backTransparent;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    data['front_shiny_transparent'] = frontShinyTransparent;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontTransparent,
  });
  late final String backDefault;
  late final String backShiny;
  late final String frontDefault;
  late final String frontShiny;
  late final String frontTransparent;

  Gold.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class Silver {
  Silver({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontTransparent,
  });
  late final String backDefault;
  late final String backShiny;
  late final String frontDefault;
  late final String frontShiny;
  late final String frontTransparent;

  Silver.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class Generationiii {
  Generationiii({
    required this.emerald,
    required this.fireredleafgreen,
    required this.rubysapphire,
  });
  late final Emerald emerald;
  late final Fireredleafgreen fireredleafgreen;
  late final Rubysapphire rubysapphire;

  Generationiii.fromJson(Map<String, dynamic> json) {
    emerald = Emerald.fromJson(json['emerald']);
    fireredleafgreen = Fireredleafgreen.fromJson(json['firered-leafgreen']);
    rubysapphire = Rubysapphire.fromJson(json['ruby-sapphire']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['emerald'] = emerald.toJson();
    data['firered-leafgreen'] = fireredleafgreen.toJson();
    data['ruby-sapphire'] = rubysapphire.toJson();
    return data;
  }
}

class Emerald {
  Emerald({
    required this.frontDefault,
    required this.frontShiny,
  });
  late final String frontDefault;
  late final String frontShiny;

  Emerald.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}

class Fireredleafgreen {
  Fireredleafgreen({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });
  late final String backDefault;
  late final String backShiny;
  late final String frontDefault;
  late final String frontShiny;

  Fireredleafgreen.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}

class Rubysapphire {
  Rubysapphire({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });
  late final String backDefault;
  late final String backShiny;
  late final String frontDefault;
  late final String frontShiny;

  Rubysapphire.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}

class Generationiv {
  Generationiv({
    required this.diamondpearl,
    required this.heartgoldsoulsilver,
    required this.platinum,
  });
  late final Diamondpearl diamondpearl;
  late final Heartgoldsoulsilver heartgoldsoulsilver;
  late final Platinum platinum;

  Generationiv.fromJson(Map<String, dynamic> json) {
    diamondpearl = Diamondpearl.fromJson(json['diamond-pearl']);
    heartgoldsoulsilver =
        Heartgoldsoulsilver.fromJson(json['heartgold-soulsilver']);
    platinum = Platinum.fromJson(json['platinum']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['diamond-pearl'] = diamondpearl.toJson();
    data['heartgold-soulsilver'] = heartgoldsoulsilver.toJson();
    data['platinum'] = platinum.toJson();
    return data;
  }
}

class Diamondpearl {
  Diamondpearl({
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

  Diamondpearl.fromJson(Map<String, dynamic> json) {
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

class Heartgoldsoulsilver {
  Heartgoldsoulsilver({
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

  Heartgoldsoulsilver.fromJson(Map<String, dynamic> json) {
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

class Platinum {
  Platinum({
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

  Platinum.fromJson(Map<String, dynamic> json) {
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

class Generationv {
  Generationv({
    required this.blackwhite,
  });
  late final Blackwhite blackwhite;

  Generationv.fromJson(Map<String, dynamic> json) {
    blackwhite = Blackwhite.fromJson(json['black-white']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['black-white'] = blackwhite.toJson();
    return data;
  }
}

class Blackwhite {
  Blackwhite({
    required this.animated,
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final Animated animated;
  late final String backDefault;
  late final dynamic backFemale;
  late final String backShiny;
  late final dynamic backShinyFemale;
  late final String frontDefault;
  late final dynamic frontFemale;
  late final String frontShiny;
  late final dynamic frontShinyFemale;

  Blackwhite.fromJson(Map<String, dynamic> json) {
    animated = Animated.fromJson(json['animated']);
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
    data['animated'] = animated.toJson();
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

class Generationvi {
  Generationvi({
    required this.omegarubyalphasapphire,
    required this.xy,
  });
  late final Omegarubyalphasapphire omegarubyalphasapphire;
  late final Xy xy;

  Generationvi.fromJson(Map<String, dynamic> json) {
    omegarubyalphasapphire =
        Omegarubyalphasapphire.fromJson(json['omegaruby-alphasapphire']);
    xy = Xy.fromJson(json['x-y']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['omegaruby-alphasapphire'] = omegarubyalphasapphire.toJson();
    data['x-y'] = xy.toJson();
    return data;
  }
}

class Omegarubyalphasapphire {
  Omegarubyalphasapphire({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final String frontDefault;
  late final dynamic frontFemale;
  late final String frontShiny;
  late final dynamic frontShinyFemale;

  Omegarubyalphasapphire.fromJson(Map<String, dynamic> json) {
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

class Xy {
  Xy({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final String frontDefault;
  late final dynamic frontFemale;
  late final String frontShiny;
  late final dynamic frontShinyFemale;

  Xy.fromJson(Map<String, dynamic> json) {
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

class Generationvii {
  Generationvii({
    required this.icons,
    required this.ultrasunultramoon,
  });
  late final Icons icons;
  late final Ultrasunultramoon ultrasunultramoon;

  Generationvii.fromJson(Map<String, dynamic> json) {
    icons = Icons.fromJson(json['icons']);
    ultrasunultramoon =
        Ultrasunultramoon.fromJson(json['ultra-sun-ultra-moon']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icons'] = icons.toJson();
    data['ultra-sun-ultra-moon'] = ultrasunultramoon.toJson();
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

class Ultrasunultramoon {
  Ultrasunultramoon({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });
  late final String frontDefault;
  late final dynamic frontFemale;
  late final String frontShiny;
  late final dynamic frontShinyFemale;

  Ultrasunultramoon.fromJson(Map<String, dynamic> json) {
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

class Generationviii {
  Generationviii({
    required this.icons,
  });
  late final Icons icons;

  Generationviii.fromJson(Map<String, dynamic> json) {
    icons = Icons.fromJson(json['icons']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icons'] = icons.toJson();
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
