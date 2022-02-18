part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterDataState extends FilterState {
  final List<String> data;
  FilterDataState({required this.data});
}
