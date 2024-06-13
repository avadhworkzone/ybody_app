part of 'detailed_diet_food_cubit.dart';

@immutable
abstract class DetailedDietFoodState {}

class DetailedDietFoodInitial extends DetailedDietFoodState {}
class DetailedDietFoodLoading extends DetailedDietFoodState {}
class DetailedDietFoodSuccess extends DetailedDietFoodState {
  final DetailedProduct detailedProduct;

  DetailedDietFoodSuccess(this.detailedProduct);
}
class DetailedDietFoodFailure extends DetailedDietFoodState {
  final String errorMessage;

  DetailedDietFoodFailure(this.errorMessage);
}
