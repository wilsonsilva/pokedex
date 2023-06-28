import 'package:flutter/material.dart';

class NoPokemonFound extends StatelessWidget {
  const NoPokemonFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No pokemons found',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
