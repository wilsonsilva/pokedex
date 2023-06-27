import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/router.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/widgets/type_badge.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonTile(this.pokemon, {Key? key}) : super(key: key);

  void displayPokemonDetails(BuildContext context, Pokemon pokemon) {
    final location = context.namedLocation(
      Routes.pokemonDetails.name,
      pathParameters: {'johtoPokedexNumber': pokemon.johtoPokedexNumber.toString()},
    );
    context.go(location);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          displayPokemonDetails(context, pokemon);
        },
        // child: Placeholder(),
        child: Container(
          decoration: BoxDecoration(
            color: getTypeColor(pokemon.types.first),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: Svg(
                  'assets/pokeball_pokemon_tile.svg',
                  size: Size(100.0, 100.0),
                ),
                alignment: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // name and pokedex number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '#${pokemon.johtoPokedexNumber.toString().padLeft(3, '0')}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // types and thumbnail
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TypeBadge(pokemonType: pokemon.types.first),

                          const SizedBox(height: 5),

                          if (pokemon.types.length > 1)
                            TypeBadge(pokemonType: pokemon.types.last)
                        ],
                      ),
                      Image.asset(
                        pokemon.thumbnail,
                        width: 80,
                        height: 80,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
