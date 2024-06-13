part of 'all_supplements_cubit.dart';

@immutable
abstract class AllSupplementsState {}

class AllSupplementsInitial extends AllSupplementsState {}
class AllSupplementsLoading extends AllSupplementsState {}
class AllSupplementsSuccess extends AllSupplementsState {
  final List<Product> supplements;

  AllSupplementsSuccess(this.supplements);
}
class AllSupplementsFailure extends AllSupplementsState {
  final String errorMessage;

  AllSupplementsFailure(this.errorMessage);
}


