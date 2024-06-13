part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesFailure extends CategoriesState {
  final String errorMessage;

  CategoriesFailure(this.errorMessage);
}
class CategoriesSuccess extends CategoriesState {
  final List<Category> categories;
  final List<Widget> views;
  CategoriesSuccess(this.categories, this.views);
}


