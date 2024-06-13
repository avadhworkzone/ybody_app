part of 'all_diet_foods_cubit.dart';

@immutable
abstract class AllDietFoodsState {}

class AllDietFoodsInitial extends AllDietFoodsState {}
class AllDietFoodsSuccess extends AllDietFoodsState {
  final List<Product> foods;

  AllDietFoodsSuccess(this.foods);
}
class AllDietFoodsFailure extends AllDietFoodsState {
  final String errorMessage;

  AllDietFoodsFailure(this.errorMessage);
}
class AllDietFoodsLoading extends AllDietFoodsState {}
