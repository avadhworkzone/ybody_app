part of 'all_coaches_cubit.dart';

@immutable
abstract class AllCoachesState {}

class AllCoachesInitial extends AllCoachesState {}
class AllCoachesLoading extends AllCoachesState {}
class AllCoachesSuccess extends AllCoachesState {
  final List<Coach> coaches;

  AllCoachesSuccess(this.coaches);
}
class AllCoachesFailure extends AllCoachesState {
  final String errorMessage;

  AllCoachesFailure(this.errorMessage);
}
