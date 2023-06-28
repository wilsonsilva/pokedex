import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/config/colors.dart';
import 'package:pokedex/features/list/presentation/pokemons_search_state_provider.dart';

class PokemonSearchBar extends ConsumerStatefulWidget {
  const PokemonSearchBar({super.key});

  @override
  ConsumerState<PokemonSearchBar> createState() => _PokemonSearchBarState();
}

class _PokemonSearchBarState extends ConsumerState<PokemonSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _controller.dispose();
    super.dispose();
  }

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
      onChanged: (text) => ref.read(pokemonsSearchQueryStateProvider.notifier).state = text,
    );
  }
}
