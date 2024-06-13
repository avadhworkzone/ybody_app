part of 'filtered_accessory_cubit.dart';

@immutable
abstract class FilteredAccessoryState {}

class FilteredAccessoryInitial extends FilteredAccessoryState {}
class FilteredAccessoryLoading extends FilteredAccessoryState {}
class FilteredAccessoryFailure extends FilteredAccessoryState {
  final String errorMessage;

  FilteredAccessoryFailure(this.errorMessage);
}
class FilteredAccessorySuccess extends FilteredAccessoryState {
  final SubCategory subCategory;

  FilteredAccessorySuccess(this.subCategory);
}
