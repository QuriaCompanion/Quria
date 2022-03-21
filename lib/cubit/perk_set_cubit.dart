import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';

part 'perk_set_state.dart';

class PerkSetCubit extends Cubit<PerkSetState> {
  PerkSetCubit() : super(PerkSetInitial());

  void changePerk(InspectColumn id, data) {}
}
