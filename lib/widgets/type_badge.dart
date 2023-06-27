import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/data/pokemon.dart';

class TypeBadge extends StatelessWidget {
  PokemonType pokemonType;

  TypeBadge({super.key, required this.pokemonType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 6, 14, 6),
        child: Row(
          children: [
            Container(
              width: 25, // specify your desired width
              height: 25, // specify your desired height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getTypeColor(pokemonType),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/types/${pokemonType.name}.svg',
                  color: Colors.white,
                  width: 20,
                  height: 20,
                ),
              ),
            ),

            const SizedBox(width: 6),

            Text(
              pokemonType.name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
