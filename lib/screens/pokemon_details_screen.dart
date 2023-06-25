import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/data/pokemons.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final int johtoPokedexNumber;

  const PokemonDetailsScreen({
    Key? key,
    required this.johtoPokedexNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pokemon? pokemon = pokemons.firstWhereOrNull(
      (pokemon) => pokemon.johtoPokedexNumber == johtoPokedexNumber,
    );

    if (pokemon == null) {
      // Pokemon not found, display an error message or handle it accordingly
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon details'),
        ),
        body: const Center(
          child: Text('Pokemon not found.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: pokemonTypeColors[pokemon.type],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: pokemonTypeColors[pokemon.type]!.withOpacity(0.2),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                pokemon.avatar,
                height: 570,
              ),
              const SizedBox(height: 20),
              Text(
                'Johto Pokedex Number: ${pokemon.johtoPokedexNumber}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'National Pokedex Number: ${pokemon.nationalPokedexNumber}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Type: ${pokemon.type.name}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
