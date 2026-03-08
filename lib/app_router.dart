import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/settings_screen.dart';
import 'business_logic/cubit/characters_cubit.dart';
import 'constants/strings.dart';
import 'data/models/characters.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_web_services.dart';
import 'presentation/screens/character_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    final charactersWebServices = CharactersWebServices();
    charactersRepository = CharactersRepository(charactersWebServices);
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: charactersCubit..getCharacters(baseUrl),
            child: CharactersScreen(),
          ),
        );
      case chracterDetailsScreen:
        final character =
            settings.arguments as Result; // استخراج الشخصية من الـ arguments
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(character: character),
        );
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
    }
    return null;
  }
}
