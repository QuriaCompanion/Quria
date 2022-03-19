import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'perk_set_state.dart';

class PerkSetCubit extends Cubit<PerkSetState> {
  PerkSetCubit() : super(PerkSetInitial());

  void changePerk(id, body) {
    emit(PerkSetDataState(id: id, body: body));
  }
}
