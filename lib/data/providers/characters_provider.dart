import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/foundation.dart';

class CharactersProvider with ChangeNotifier {
  List<DestinyCharacterComponent> _characters = [];
  DestinyCharacterComponent? _currentCharacter;
  List<DestinyCharacterComponent>? get characters => _characters;
  DestinyCharacterComponent? get currentCharacter => _currentCharacter;

  void setCharacters(
    List<DestinyCharacterComponent> characters,
  ) {
    _characters = characters;
    notifyListeners();
  }

  void setCurrentCharacter(
    DestinyCharacterComponent character,
  ) {
    _currentCharacter = character;
    notifyListeners();
  }
}
