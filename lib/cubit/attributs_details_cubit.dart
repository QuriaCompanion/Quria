import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'attributs_details_state.dart';

class AttributsDetailsCubit extends Cubit<AttributsDetailsState> {
  AttributsDetailsCubit() : super(AttributsDetailsInitial());

  void changeId(id) {
    emit(AttributsDetailsIdState(id: id));
  }
}
