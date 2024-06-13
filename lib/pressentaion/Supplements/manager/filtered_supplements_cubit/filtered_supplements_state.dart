part of 'filtered_supplements_cubit.dart';

@immutable
abstract class FilteredSupplementsState {}

class FilteredSupplementsInitial extends FilteredSupplementsState {}
class FilteredSupplementsLoading extends FilteredSupplementsState {}
class FilteredSupplementsSuccess extends FilteredSupplementsState {
  final Brand brand;

  FilteredSupplementsSuccess(this.brand);
}
class FilteredSupplementsFailure extends FilteredSupplementsState {
  final String errorMessage;

  FilteredSupplementsFailure(this.errorMessage);
}

