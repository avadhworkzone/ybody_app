part of 'accessories_categories_cubit.dart';

@immutable
abstract class AccessoriesCategoriesState {}

class AccessoriesCategoriesInitial extends AccessoriesCategoriesState {}
class AccessoriesCategoriesLoading extends AccessoriesCategoriesState {}
class AccessoriesCategoriesFailure extends AccessoriesCategoriesState {
  final String errorMessage;

  AccessoriesCategoriesFailure(this.errorMessage);
}
class AccessoriesCategoriesSuccess extends AccessoriesCategoriesState {
  final List<SubCategory> categories;

  AccessoriesCategoriesSuccess(this.categories);
}
