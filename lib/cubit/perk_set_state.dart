part of 'perk_set_cubit.dart';

@immutable
abstract class PerkSetState {}

class PerkSetInitial extends PerkSetState {}

class PerkSetDataState extends PerkSetState {
  final InspectHelper body;
  PerkSetDataState({required this.body});
}
