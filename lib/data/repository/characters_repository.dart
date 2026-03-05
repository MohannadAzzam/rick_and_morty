import '../models/characters.dart';
import '../web_services/characters_web_services.dart';

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
