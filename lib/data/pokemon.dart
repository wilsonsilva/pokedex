enum PokemonType {
  fire,
  grass
}

class Pokemon {
  String name;
  int johtoPokedexNumber;
  int nationalPokedexNumber;
  PokemonType type;
  String avatar;
  String thumbnail;

  Pokemon({
    required this.name,
    required this.johtoPokedexNumber,
    required this.nationalPokedexNumber,
    required this.type,
    required this.avatar,
    required this.thumbnail,
  });
}
