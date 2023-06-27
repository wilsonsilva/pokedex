import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pokedex/common/pokedex_bottom_navigation_bar.dart';
import 'package:pokedex/config/colors.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/data/pokemons.dart';
import 'package:pokedex/features/list/presentation/filter_button.dart';
import 'package:pokedex/features/list/presentation/pokemon_search_bar.dart';
import 'package:pokedex/features/list/presentation/pokemon_tile.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const PokedexBottomNavigationBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Svg(
              'assets/pokeball.svg',
              size: Size(200.0, 200.0),
            ),
            opacity: 0.1,
            alignment: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: gray500,
                ),
              ),

              const Text(
                'Use the advanced search to find Pokémon by type, weakness, ability and more!',
                style: TextStyle(
                  fontSize: 16,
                  color: gray400,
                )
              ),

              const SizedBox(height: 25),

              const Row(
                children: [
                  Expanded(
                    child: PokemonSearchBar(),
                  ),

                  SizedBox(width: 10),

                  FilterButton(),
                ],
              ),

              const SizedBox(height: 25),

              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
