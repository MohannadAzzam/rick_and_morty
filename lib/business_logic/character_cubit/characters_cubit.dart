import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../data/models/characters.dart';
import '../../data/repository/characters_repository.dart';
// import 'package:http/http.dart' as http;

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());


// دالة جلب البيانات
  void getCharacters(String url) async {
    // 1. أخبر الواجهة بأننا في حالة تحميل
    emit(CharactersLoading());

    try {
      // 2. اطلب البيانات من الـ Repository
      final character = await charactersRepository.fetchAllCharacters(url);

      if (character != null) {
        // 3. إذا نجحت، أرسل البيانات كاملة (بما فيها روابط next و prev)
        emit(CharactersSuccess(character));
      } else {
        emit(CharactersError("لا توجد بيانات حالياً"));
      }
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}



  // Future<void> fetchCharacters() async {
  //   emit(CharactersLoading());
  //   try {
  //     final response = await http.get(Uri.parse(baseUrl));

  //     if (response.statusCode == 200) {
  //       final characterData = characterFromJson(response.body);
  //       emit(CharactersSuccess(characterData));
  //     } else {
  //       emit(CharactersError("فشل جلب البيانات من السيرفر"));
  //     }
  //     // final character = Character(
  //     //   info: Info(count: 1, pages: 1, next: null, prev: null),
  //     //   results: [
  //     //     Result(
  //     //       id: 1,
  //     //       name: 'Rick Sanchez',
  //     //       status: Status.alive,
  //     //       species: Species.human,
  //     //     ),
  //     //   ],
  //     // );
  //     // emit(CharactersSuccess(character));
  //   } catch (e) {
  //     emit(CharactersError(e.toString()));
  //   }
  // }

