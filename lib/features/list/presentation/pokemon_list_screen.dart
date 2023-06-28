import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pokedex/common/pokedex_bottom_navigation_bar.dart';
import 'package:pokedex/config/colors.dart';
import 'package:pokedex/features/list/presentation/filter_button.dart';
import 'package:pokedex/features/list/presentation/pokemon_grid_async.dart';
import 'package:pokedex/features/list/presentation/pokemon_search_bar.dart';

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
        child: const Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: gray500,
                ),
              ),
              Text(
                'Use the advanced search to find Pokémon by type, weakness, ability and more!',
                style: TextStyle(
                  fontSize: 16,
                  color: gray400,
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: PokemonSearchBar()
                  ),
                  SizedBox(width: 10),
                  FilterButton(),
                ],
              ),
              SizedBox(height: 25),
              PokemonGridAsync(),
            ],
          ),
        ),
      ),
    );
  }
}
