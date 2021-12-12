import 'package:bloc/bloc.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  void showDetails() {
    emit(ShowDetailsState());
  }

  void hideDetails() {
    emit(CharacterInitial());
  }
}
