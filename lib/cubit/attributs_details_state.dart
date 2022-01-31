part of 'attributs_details_cubit.dart';

@immutable
abstract class AttributsDetailsState {}

class AttributsDetailsInitial extends AttributsDetailsState {}

class AttributsDetailsIdState extends AttributsDetailsState {
  final int id;
  AttributsDetailsIdState({required this.id});
}
