import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/constants/strings.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/repository/characters_repository.dart';
import 'package:rick_and_morty/data/web_services/characters_web_services.dart';
import 'package:rick_and_morty/presentation/screens/character_details_screen.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen.dart';

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
  final character = settings.arguments; // استخراج الشخصية من الـ arguments
  return MaterialPageRoute(
    builder: (_) => CharacterDetailsScreen(character: character as Result),
  ); }
      return null;
  }
}
