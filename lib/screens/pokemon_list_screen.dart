import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/router.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/data/pokemons.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          Pokemon pokemon = pokemons[index];

          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Text(
              pokemon.name,
              style: TextStyle(
                fontSize: 24,
                color: pokemonTypeColors[pokemon.type],
              ),
            ),
            subtitle: Text(
              '# ${pokemon.johtoPokedexNumber}',
              style: const TextStyle(fontSize: 14),
            ),
            leading: Image.asset(
              pokemon.thumbnail,
              width: 80,
              height: 80,
            ),
            onTap: () {
              if (pokemon.type == PokemonType.grass) {
                context.pushNamed(
                  Routes.pokemonDetails.name,
                  pathParameters: {'johtoPokedexNumber': pokemon.johtoPokedexNumber.toString()}
                );
              } else {
                final location = context.namedLocation(
                  Routes.pokemonDetails.name,
                  pathParameters: {'johtoPokedexNumber': pokemon.johtoPokedexNumber.toString()}
                );
                context.go(location);
              }
            },
          );
        },
      ),
    );
  }
}
