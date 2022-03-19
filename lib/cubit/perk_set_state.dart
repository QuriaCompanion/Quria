part of 'perk_set_cubit.dart';

@immutable
abstract class PerkSetState {}

class PerkSetInitial extends PerkSetState {}

class PerkSetDataState extends PerkSetState {
  final int id;
  final Map<String, Socket> body;
  PerkSetDataState({required this.id, required this.body});
}
