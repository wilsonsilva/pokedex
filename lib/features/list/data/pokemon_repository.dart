import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/common/delay.dart';
import 'package:pokedex/common/in_memory_store.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/data/test_pokemons.dart';

class FakePokemonsRepository {
  FakePokemonsRepository({this.addDelay = true});
  final bool addDelay;

  /// Preload with the default list of pokemons when the app starts
  final _pokemons = InMemoryStore<List<Pokemon>>(List.from(kTestPokemons));

  List<Pokemon> getPokemonsList() {
    return _pokemons.value;
  }

  Pokemon? getPokemon(int johtoPokedexNumber) {
    return _getPokemon(_pokemons.value, johtoPokedexNumber);
  }

  Future<List<Pokemon>> fetchPokemonsList() async {
    await delay(addDelay);
    return Future.value(_pokemons.value);
  }

  Stream<List<Pokemon>> watchPokemonsList() {
    return _pokemons.stream;
  }

  Stream<Pokemon?> watchPokemon(int johtoPokedexNumber) {
    return watchPokemonsList().map((pokemons) => _getPokemon(pokemons, johtoPokedexNumber));
  }

  /// Update pokemon or add a new one
  Future<void> setPokemon(Pokemon pokemon) async {
    await delay(addDelay);
    final pokemons = _pokemons.value;
    final index = pokemons.indexWhere((p) => p.johtoPokedexNumber == pokemon.johtoPokedexNumber);

    if (index == -1) {
      // if not found, add as a new pokemon
      pokemons.add(pokemon);
    } else {
      // else, overwrite previous pokemon
      pokemons[index] = pokemon;
    }
    _pokemons.value = pokemons;
  }

  /// Search for pokemons where the name contains the search query
  Future<List<Pokemon>> searchPokemons(String query) async {
    // Get all pokemons
    final pokemonsList = await fetchPokemonsList();
    // Match all pokemons where the name contains the query
    return pokemonsList
        .where((pokemon) =>
        pokemon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  static Pokemon? _getPokemon(List<Pokemon> pokemons, int johtoPokedexNumber) {
    try {
      return pokemons.firstWhere((pokemon) => pokemon.johtoPokedexNumber == johtoPokedexNumber);
    } catch (e) {
      return null;
    }
  }
}

final pokemonsRepositoryProvider = Provider<FakePokemonsRepository>((ref) {
  // * Set addDelay to false for faster loading
  return FakePokemonsRepository(addDelay: false);
});

final pokemonsListStreamProvider = StreamProvider.autoDispose<List<Pokemon>>((ref) {
  final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);
  return pokemonsRepository.watchPokemonsList();
});

final pokemonsListFutureProvider = FutureProvider.autoDispose<List<Pokemon>>((ref) {
  final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);
  return pokemonsRepository.fetchPokemonsList();
});

final pokemonProvider = StreamProvider.autoDispose.family<Pokemon?, int>((ref, johtoPokedexNumber) {
  final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);
  return pokemonsRepository.watchPokemon(johtoPokedexNumber);
});

final pokemonsListSearchProvider = FutureProvider.autoDispose.family<List<Pokemon>, String>((ref, query) async {
  final link = ref.keepAlive();
  // * keep previous search results in memory for 60 seconds
  final timer = Timer(const Duration(seconds: 60), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);
  return pokemonsRepository.searchPokemons(query);
});
