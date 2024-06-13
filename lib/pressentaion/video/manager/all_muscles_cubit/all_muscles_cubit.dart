import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/muscles/Muscle.dart';
import 'package:x_fitness/pressentaion/video/muscles_repo.dart';

part 'all_muscles_state.dart';

class AllMusclesCubit extends Cubit<AllMusclesState> {
  AllMusclesCubit(this.musclesRepo) : super(AllMusclesInitial());
  final MusclesRepo musclesRepo;
  Future<void> getAllMuscles() async {
    emit(MusclesLoading());
    var result = await musclesRepo.getAllMuscles();
    result.fold(
            (failure) => emit(MusclesFailure(failure.errorMessage)),
            (muscles) => emit(MusclesSuccess(muscles)));
  }
}
