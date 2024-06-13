part of 'equipments_categories_cubit.dart';

@immutable
abstract class EquipmentsCategoriesState {}

class EquipmentsCategoriesInitial extends EquipmentsCategoriesState {}
class EquipmentsCategoriesLoading extends EquipmentsCategoriesState {}
class EquipmentsCategoriesFailure extends EquipmentsCategoriesState {
  final String errorMessage;

  EquipmentsCategoriesFailure(this.errorMessage);

}
class EquipmentsCategoriesSuccess extends EquipmentsCategoriesState {
  final List<SubCategory> categories;

  EquipmentsCategoriesSuccess(this.categories);

}
