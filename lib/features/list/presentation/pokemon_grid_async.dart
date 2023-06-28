import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/async_value_widget.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/features/list/presentation/no_pokemon_found.dart';
import 'package:pokedex/features/list/presentation/pokemon_grid.dart';
import 'package:pokedex/features/list/presentation/pokemons_search_state_provider.dart';

class PokemonGridAsync extends ConsumerWidget {
  const PokemonGridAsync({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsListValue = ref.watch(pokemonsSearchResultsProvider);

    return AsyncValueWidget<List<Pokemon>>(
      value: pokemonsListValue,
      data: (pokemons) => pokemons.isEmpty ? const NoPokemonFound() : PokemonGrid(pokemons),
    );
  }
}
