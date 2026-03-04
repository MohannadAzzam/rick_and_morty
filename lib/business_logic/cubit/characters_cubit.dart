import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:http/http.dart' as http;

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  Future<void> fetchCharacters() async {
    emit(CharactersLoading());
    try {
      final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character'),
      );
      // Simulate a network call to fetch characters
      // await Future.delayed(const Duration(seconds: 2));
      // For demonstration, we will create a dummy character
      if (response.statusCode == 200) {
        final characterData = characterFromJson(response.body);
        emit(CharactersSuccess(characterData));
      } else{
        emit(CharactersError("فشل جلب البيانات من السيرفر"));
      }
      // final character = Character(
      //   info: Info(count: 1, pages: 1, next: null, prev: null),
      //   results: [
      //     Result(
      //       id: 1,
      //       name: 'Rick Sanchez',
      //       status: Status.alive,
      //       species: Species.human,
      //     ),
      //   ],
      // );
      // emit(CharactersSuccess(character));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}
