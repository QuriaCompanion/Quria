import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weapon_details_state.dart';

class WeaponDetailsCubit extends Cubit<WeaponDetailsState> {
  WeaponDetailsCubit() : super(WeaponDetailsInitial());

  void changeId(id) {
    emit(WeaponDetailsIdState(id: id));
  }
}
