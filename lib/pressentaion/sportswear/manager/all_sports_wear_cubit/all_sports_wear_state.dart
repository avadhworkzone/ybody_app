part of 'all_sports_wear_cubit.dart';

@immutable
abstract class AllSportsWearState {}

class AllSportsWearInitial extends AllSportsWearState {}
class AllSportsWearLoading extends AllSportsWearState {}
class AllSportsWearFailure extends AllSportsWearState {
  final String errorMessage;

  AllSportsWearFailure(this.errorMessage);
}
class AllSportsWearSuccess extends AllSportsWearState {
  final List<Product> wears;
  AllSportsWearSuccess(this.wears);
}

