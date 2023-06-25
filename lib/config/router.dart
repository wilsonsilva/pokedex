import 'package:go_router/go_router.dart';
import 'package:pokedex/screens/pokemon_details_screen.dart';
import 'package:pokedex/screens/pokemon_list_screen.dart';

enum Routes {
  pokemonList,
  pokemonDetails,
}

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: Routes.pokemonList.name,
      builder: (context, state) => const PokemonListScreen(),
    ),
    GoRoute(
      path: '/pokemons/:johtoPokedexNumber',
      name: Routes.pokemonDetails.name,
      builder: (context, state) => PokemonDetailsScreen(
        johtoPokedexNumber: int.parse(state.pathParameters['johtoPokedexNumber']!),
      ),
    ),
  ],
);