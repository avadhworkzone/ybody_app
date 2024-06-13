part of 'all_gyms_cubit.dart';

@immutable
abstract class AllGymsState {}

class AllGymsInitial extends AllGymsState {}
class AllGymsLoading extends AllGymsState {}
class AllGymsSuccess extends AllGymsState {
  final List<Gym> gyms;

  AllGymsSuccess(this.gyms);
}
class AllGymsFailure extends AllGymsState {
  final String errorMessage;

  AllGymsFailure(this.errorMessage);
}

