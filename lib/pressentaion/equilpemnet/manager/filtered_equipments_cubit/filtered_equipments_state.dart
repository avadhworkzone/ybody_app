part of 'filtered_equipments_cubit.dart';

@immutable
abstract class FilteredEquipmentsState {}

class FilteredEquipmentsInitial extends FilteredEquipmentsState {}
class FilteredEquipmentsLoading extends FilteredEquipmentsState {}
class FilteredEquipmentsFailure extends FilteredEquipmentsState {
  final String errorMessage;

  FilteredEquipmentsFailure(this.errorMessage);
}
class FilteredEquipmentsSuccess extends FilteredEquipmentsState {
  final SubCategory subCategory;

  FilteredEquipmentsSuccess(this.subCategory);
}
