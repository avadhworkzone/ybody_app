part of 'sports_wear_categories_cubit.dart';

@immutable
abstract class SportsWearCategoriesState {}

class SportsWearCategoriesInitial extends SportsWearCategoriesState {}
class SportsWearCategoriesLoading extends SportsWearCategoriesState {}
class SportsWearCategoriesFailure extends SportsWearCategoriesState {
  final String errorMessage;

  SportsWearCategoriesFailure(this.errorMessage);
}
class SportsWearCategoriesSuccess extends SportsWearCategoriesState {
  final List<SubCategory> categories;

  SportsWearCategoriesSuccess(this.categories);
}

