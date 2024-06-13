import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/video/muscles_repo.dart';

import '../../../../models/muscles/MusclePartFile.dart';

part 'muscles_files_state.dart';

class MusclesFilesCubit extends Cubit<MusclesFilesState> {
  MusclesFilesCubit(this.musclesRepo) : super(MusclesFilesInitial());
  final MusclesRepo musclesRepo;
  Future<void> getMusclesFiles({required int muscleId, required int partId})async{
    emit(MusclesFilesLoading());
    var result = await musclesRepo.getPartFiles(muscleId: muscleId, partId: partId);
    result.fold(
            (failure) => emit(MusclesFilesFailure(failure.errorMessage)),
            (files) => emit(MusclesFilesSuccess(files))
    );
  }
}
