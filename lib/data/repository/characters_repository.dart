import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<Character?> fetchAllCharacters(String url) async {
    final charactersMap = await charactersWebServices.getAllCharacters(url);
    if (charactersMap.isNotEmpty) {
      return Character.fromJson(charactersMap);
    }
    return null;
  }
}
