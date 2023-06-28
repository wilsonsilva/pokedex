import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/async_value_widget.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/features/list/data/pokemon_repository.dart';

class PokemonDetailsScreen extends ConsumerWidget {
  final int johtoPokedexNumber;

  const PokemonDetailsScreen({
    Key? key,
    required this.johtoPokedexNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonValue = ref.watch(pokemonProvider(johtoPokedexNumber));

    return AsyncValueWidget<Pokemon?>(
      value: pokemonValue,
      data: (pokemon) {
        if (pokemon == null) {
          // Pokemon not found, display an error message or handle it accordingly
          return const Scaffold(
            body: Center(
              child: Text('Pokemon not found.'),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: getTypeColor(pokemon.types.first).withOpacity(0.2),
              ),
              child: Column(
                children: [
                  const BackButton(),
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
                    'Type: ${pokemon.types.first.name}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
