import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/features/list/presentation/pokemon_tile.dart';

class PokemonGrid extends StatelessWidget {
  final List<Pokemon> pokemons;
  const PokemonGrid(this.pokemons, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.25,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          Pokemon pokemon = pokemons[index];

          return PokemonTile(pokemon);
        },
      ),
    );
  }
}
