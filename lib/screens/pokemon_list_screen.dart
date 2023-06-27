import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pokedex/config/colors.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/data/pokemons.dart';
import 'package:pokedex/widgets/pokedex_bottom_navigation_bar.dart';
import 'package:pokedex/widgets/pokemon_tile.dart';

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

              Row(
                children: [
                  Expanded(
                    child: SearchBar(
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
                    ),
                  ),

                  const SizedBox(width: 10),

                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      backgroundColor: gray200,
                      elevation: 0,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Icon(Icons.filter_list_alt, color: Colors.black),
                    )
                  ),
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
