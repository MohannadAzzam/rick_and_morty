
import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/strings.dart';
import 'package:rick_and_morty/presentation/screens/character_details_screen.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());
      case chracterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
    return null;
  }
}
