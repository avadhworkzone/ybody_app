part of 'filtered_sports_wear_cubit.dart';

@immutable
abstract class FilteredSportsWearState {}

class FilteredSportsWearInitial extends FilteredSportsWearState {}
class FilteredSportsWearLoading extends FilteredSportsWearState {}
class FilteredSportsWearFailure extends FilteredSportsWearState {
  final String errorMessage;

  FilteredSportsWearFailure(this.errorMessage);
}
class FilteredSportsWearSuccess extends FilteredSportsWearState {
  final SubCategory subCategory;

  FilteredSportsWearSuccess(this.subCategory);
}



