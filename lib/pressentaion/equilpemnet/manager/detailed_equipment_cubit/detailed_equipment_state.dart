part of 'detailed_equipment_cubit.dart';

@immutable
abstract class DetailedEquipmentState {}

class DetailedEquipmentInitial extends DetailedEquipmentState {}
class DetailedEquipmentLoading extends DetailedEquipmentState {}
class DetailedEquipmentSuccess extends DetailedEquipmentState {
  final DetailedProduct detailedEquipment;
  DetailedEquipmentSuccess(this.detailedEquipment);
}
class DetailedEquipmentFailure extends DetailedEquipmentState {
  final String errorMessage;

  DetailedEquipmentFailure(this.errorMessage);
}

