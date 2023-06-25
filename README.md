# Pokédex

The Pokédex (ポケモン 図鑑 ずかん , Pokemon Zukan, Illustrated Pokémon Encyclopedia) is an electronic
device created and designed to catalog and provide information regarding the various species of
Pokémon featured in the Pokémon video game, anime and manga series.

<p align="center">
  <img src=".github/assets/home-screen.png?raw=true" alt="Home screen" width="400px"/>
</p>

This Flutter app showcases an issue with the GoRouter package whereby it is not possible to
__simultaneously__ navigate to a named route and:
1. Replace the browser's URL (`/#/collection/:resourceId`) - needed for deep linking in the browser
2. Retain the back button on the `AppBar` - needed for back navigation in mobile phones

Clicking on the 3 first grass-type Pokémon, using `context.pushNamed()`, will retain the back button
on the `AppBar` but won't replace the browser's URL.

Clicking on the 3 last fire-type Pokémon, using `context.go()`, will replace the browser's URL but
won't retain the back button on the `AppBar`.

![Problem](.github/assets/problem.png?raw=true "Problem")

This is the code:

```dart
  if (pokemon.type == PokemonType.grass) {
    context.pushNamed(
      Routes.pokemonDetails.name,
      pathParameters: {'johtoPokedexNumber': pokemon.johtoPokedexNumber.toString()}
    );
  } else {
    final location = context.namedLocation(
      Routes.pokemonDetails.name,
      pathParameters: {'johtoPokedexNumber': pokemon.johtoPokedexNumber.toString()}
    );
    context.go(location);
  }
```

## Demo

[https://pokedex-27b81.web.app/](https://pokedex-27b81.web.app/#/)
