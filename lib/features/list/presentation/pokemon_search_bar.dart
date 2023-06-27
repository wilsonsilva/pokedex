import 'package:flutter/material.dart';
import 'package:pokedex/config/colors.dart';

class PokemonSearchBar extends StatelessWidget {
  const PokemonSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(color: gray200),
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      elevation: const MaterialStatePropertyAll(0),
      leading: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Icon(Icons.search),
      ),
      hintText: 'Search a pokémon',
      hintStyle: const MaterialStatePropertyAll(
        TextStyle(
          color: gray300,
          fontSize: 18,
        ),
      ),
    );
  }
}
