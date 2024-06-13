part of 'supplements_categories_cubit.dart';

@immutable
abstract class SupplementsCategoriesState {}

class SupplementsCategoriesInitial extends SupplementsCategoriesState {}
class SupplementsCategoriesLoading extends SupplementsCategoriesState {}
class SupplementsCategoriesSuccess extends SupplementsCategoriesState {
  final List<Brand> categories;

  SupplementsCategoriesSuccess(this.categories);
}
class SupplementsCategoriesFailure extends SupplementsCategoriesState {
  final String errorMessage;

  SupplementsCategoriesFailure(this.errorMessage);
}

