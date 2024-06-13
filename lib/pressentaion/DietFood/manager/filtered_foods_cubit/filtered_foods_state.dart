part of 'filtered_foods_cubit.dart';

@immutable
abstract class FilteredFoodsState {}

class FilteredFoodsInitial extends FilteredFoodsState {}
class FilteredFoodsLoading extends FilteredFoodsState {}
class FilteredFoodsSuccess extends FilteredFoodsState {
  final SubCategory subCategory;

  FilteredFoodsSuccess(this.subCategory);
}
class FilteredFoodsFailure extends FilteredFoodsState {
  final String errorMessage;

  FilteredFoodsFailure(this.errorMessage);
}
