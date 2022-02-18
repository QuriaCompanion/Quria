part of 'character_cubit.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class ShowDetailsState extends CharacterState {
  final DestinyItemComponent item;
  ShowDetailsState({required this.item});
}
