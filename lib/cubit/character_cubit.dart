import 'package:bloc/bloc.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  void showDetails(item) {
    emit(ShowDetailsState(item: item));
  }

  void hideDetails() {
    emit(CharacterInitial());
  }
}
