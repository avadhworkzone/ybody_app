part of 'detailed_supplement_cubit.dart';

@immutable
abstract class DetailedSupplementState {}

class DetailedSupplementInitial extends DetailedSupplementState {}
class DetailedSupplementLoading extends DetailedSupplementState {}
class DetailedSupplementSuccess extends DetailedSupplementState {
  final DetailedProduct detailedProduct;

  DetailedSupplementSuccess(this.detailedProduct);
}
class DetailedSupplementFailure extends DetailedSupplementState {
  final String errorMessage;

  DetailedSupplementFailure(this.errorMessage);
}
