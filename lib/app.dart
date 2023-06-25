import 'package:flutter/material.dart';
import 'package:pokedex/config/router.dart';
import 'package:pokedex/config/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: theme,
    );
  }
}
