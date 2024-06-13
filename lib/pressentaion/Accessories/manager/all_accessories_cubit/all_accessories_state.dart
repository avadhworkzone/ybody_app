part of 'all_accessories_cubit.dart';

@immutable
abstract class AllAccessoriesState {}

class AllAccessoriesInitial extends AllAccessoriesState {}
class AllAccessoriesLoading extends AllAccessoriesState {}
class AllAccessoriesSuccess extends AllAccessoriesState {
  final List<Product> accessories;

  AllAccessoriesSuccess(this.accessories);
}
class AllAccessoriesFailure extends AllAccessoriesState {
  final String errorMessage;

  AllAccessoriesFailure(this.errorMessage);
}
