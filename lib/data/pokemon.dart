enum PokemonType {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water,
}

class Pokemon {
  String name;
  int johtoPokedexNumber;
  int nationalPokedexNumber;
  List<PokemonType> types;
  String avatar;
  String thumbnail;

  Pokemon({
    required this.name,
    required this.johtoPokedexNumber,
    required this.nationalPokedexNumber,
    required this.types,
    required this.avatar,
    required this.thumbnail,
  });
}
