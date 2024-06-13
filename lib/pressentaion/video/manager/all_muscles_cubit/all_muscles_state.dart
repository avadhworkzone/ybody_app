part of 'all_muscles_cubit.dart';

@immutable
abstract class AllMusclesState {}

class AllMusclesInitial extends AllMusclesState {}
class MusclesLoading extends AllMusclesState {}
class MusclesFailure extends AllMusclesState {
  final String errorMessage;

  MusclesFailure(this.errorMessage);
}
class MusclesSuccess extends AllMusclesState {
  final List<Muscle> muscles;

  MusclesSuccess(this.muscles);
}
