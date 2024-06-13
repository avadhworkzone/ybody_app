import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/Coach.dart';
import 'package:x_fitness/pressentaion/Coaches/coach_repo.dart';

part 'all_coaches_state.dart';

class AllCoachesCubit extends Cubit<AllCoachesState> {
  AllCoachesCubit(this.coachesRepo) : super(AllCoachesInitial());
  final CoachesRepo coachesRepo;
  Future<void> getAllCoaches() async {
    emit(AllCoachesLoading());
    var result = await coachesRepo.getAllCoaches();
    result.fold(
            (failure) => emit(AllCoachesFailure(failure.errorMessage)),
            (coaches) => emit(AllCoachesSuccess(coaches)));
  }
}
