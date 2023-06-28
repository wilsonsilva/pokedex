import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/pokemon.dart';
import 'package:pokedex/features/list/data/pokemon_repository.dart';

final pokemonsSearchQueryStateProvider = StateProvider<String>((ref) {
  return '';
});

final pokemonsSearchResultsProvider = FutureProvider.autoDispose<List<Pokemon>>((ref) async {
  final searchQuery = ref.watch(pokemonsSearchQueryStateProvider);
  return ref.watch(pokemonsListSearchProvider(searchQuery).future);
});
