part of 'detailed_sports_wear_cubit.dart';

@immutable
abstract class DetailedSportsWearState {}

class DetailedSportsWearInitial extends DetailedSportsWearState {}
class DetailedSportsWearLoading extends DetailedSportsWearState {}
class DetailedSportsWearFailure extends DetailedSportsWearState {
  final String errorMessage;

  DetailedSportsWearFailure(this.errorMessage);
}
class DetailedSportsWearSuccess extends DetailedSportsWearState {
  final DetailedProduct detailedProduct;

  DetailedSportsWearSuccess(this.detailedProduct);
}

