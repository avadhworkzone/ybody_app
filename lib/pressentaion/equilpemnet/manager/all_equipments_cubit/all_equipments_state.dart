part of 'all_equipments_cubit.dart';

@immutable
abstract class AllEquipmentsState {}

class AllEquipmentsInitial extends AllEquipmentsState {}
class EquipmentsLoading extends AllEquipmentsState {}
class EquipmentsFailure extends AllEquipmentsState {
  final String errorMessage;

  EquipmentsFailure(this.errorMessage);
}
class EquipmentsSuccess extends AllEquipmentsState {
  final List<Product> equipments;

  EquipmentsSuccess(this.equipments);
}

