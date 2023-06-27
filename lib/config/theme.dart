import 'package:flutter/material.dart';
import 'package:pokedex/config/colors.dart';
import 'package:pokedex/data/pokemon.dart';

const _philippineYellow = Color(0xFFFFCB05);

const _bug      = Color(0xFF83C300);
const _dark     = Color(0xFF5B5466);
const _dragon   = Color(0xFF006FC9);
const _electric = Color(0xFFFBD100);
const _fairy    = Color(0xFFFB89EB);
const _fighting = Color(0xFFE0306A);
const _fire     = Color(0xFFFF9741);
const _flying   = Color(0xFF89AAE3);
const _ghost    = Color(0xFF4C6AB2);
const _grass    = Color(0xFF38BF4B);
const _ground   = Color(0xFFE87236);
const _ice      = Color(0xFF4CD1C0);
const _normal   = Color(0xFF919AA2);
const _poison   = Color(0xFFB567CE);
const _psychic  = Color(0xFFFF6675);
const _rock     = Color(0xFFC8B686);
const _steel    = Color(0xFF5A8EA2);
const _water    = Color(0xFF3692DC);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _philippineYellow,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: gray500,
    unselectedItemColor: gray300,
    elevation: 0,
  ),
);

const Map<PokemonType, Color> _pokemonTypeColors = {
  PokemonType.bug: _bug,
  PokemonType.dark: _dark,
  PokemonType.dragon: _dragon,
  PokemonType.electric: _electric,
  PokemonType.fairy: _fairy,
  PokemonType.fighting: _fighting,
  PokemonType.fire: _fire,
  PokemonType.flying: _flying,
  PokemonType.ghost: _ghost,
  PokemonType.grass: _grass,
  PokemonType.ground: _ground,
  PokemonType.ice: _ice,
  PokemonType.normal: _normal,
  PokemonType.poison: _poison,
  PokemonType.psychic: _psychic,
  PokemonType.rock: _rock,
  PokemonType.steel: _steel,
  PokemonType.water: _water,
};

Color getTypeColor(PokemonType type) {
  return _pokemonTypeColors[type]!;
}
