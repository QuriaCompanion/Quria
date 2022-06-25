import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/foundation.dart';

class CharactersProvider with ChangeNotifier {
  List<DestinyCharacterComponent> _characters = [];
  DestinyCharacterComponent? _currentCharacter;
  int _characterIndex = 0;
  List<DestinyCharacterComponent> get characters => _characters;
  DestinyCharacterComponent? get currentCharacter => _currentCharacter;
  int get characterIndex => _characterIndex;
  void setCharacters(List<DestinyCharacterComponent> characters) {
    _characters = characters;
    notifyListeners();
  }

  void setCurrentCharacter(int index) {
    _characterIndex = index;
    _currentCharacter = _characters[index];
    notifyListeners();
  }

  void init(Map<String, DestinyCharacterComponent>? characters) {
    if (characters == null) {
      return;
    }
    List<DestinyCharacterComponent> list = characters.values.toList();
    list.sort((charA, charB) {
      DateTime dateA = DateTime.parse(charA.dateLastPlayed!);
      DateTime dateB = DateTime.parse(charB.dateLastPlayed!);
      return dateB.compareTo(dateA);
    });
    _currentCharacter = list[_characterIndex];
    _characters = list;
  }
}
