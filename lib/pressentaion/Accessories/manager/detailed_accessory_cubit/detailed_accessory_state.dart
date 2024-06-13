part of 'detailed_accessory_cubit.dart';

@immutable
abstract class DetailedAccessoryState {}

class DetailedAccessoryInitial extends DetailedAccessoryState {}
class DetailedAccessoryLoading extends DetailedAccessoryState {}
class DetailedAccessoryFailure extends DetailedAccessoryState {
  final String errorMessage;

  DetailedAccessoryFailure(this.errorMessage);
}
class DetailedAccessorySuccess extends DetailedAccessoryState {
  final DetailedProduct detailedAccessory;

  DetailedAccessorySuccess(this.detailedAccessory);
}
