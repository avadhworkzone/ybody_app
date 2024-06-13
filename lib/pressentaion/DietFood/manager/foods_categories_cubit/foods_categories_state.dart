part of 'foods_categories_cubit.dart';

@immutable
abstract class FoodsCategoriesState {}

class FoodsCategoriesInitial extends FoodsCategoriesState {}
class FoodsCategoriesLoading extends FoodsCategoriesState {}
class FoodsCategoriesSuccess extends FoodsCategoriesState {
  final List<SubCategory> categories;

  FoodsCategoriesSuccess(this.categories);
}
class FoodsCategoriesFailure extends FoodsCategoriesState {
  final String errorMessage;

  FoodsCategoriesFailure(this.errorMessage);
}

