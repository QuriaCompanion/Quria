part of 'weapon_details_cubit.dart';

@immutable
abstract class WeaponDetailsState {}

class WeaponDetailsInitial extends WeaponDetailsState {}

class WeaponDetailsIdState extends WeaponDetailsState {
  final int id;
  WeaponDetailsIdState({required this.id});
}
