import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/gyms_repo.dart';

import '../../../../models/Gym.dart';

part 'all_gyms_state.dart';

class AllGymsCubit extends Cubit<AllGymsState> {
  AllGymsCubit(this.gymsRepo) : super(AllGymsInitial());
  final GymsRepo gymsRepo;
  Future<void> getAllGyms() async {
    emit(AllGymsLoading());
    var result = await gymsRepo.getAllGyms();
    result.fold(
            (failure) => emit(AllGymsFailure(failure.errorMessage)),
            (coaches) => emit(AllGymsSuccess(coaches)));
  }
}
