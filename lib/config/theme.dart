import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon.dart';

const _philippineYellow = Color(0xFFFFCB05);
const _grassTypeGreen = Color(0xFF78C850);
const _fireTypeRed = Color(0xFFF08030);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _philippineYellow,
    brightness: Brightness.dark,
  ),
);

const Map<PokemonType, Color> pokemonTypeColors = {
  PokemonType.fire: _fireTypeRed,
  PokemonType.grass: _grassTypeGreen,
};
