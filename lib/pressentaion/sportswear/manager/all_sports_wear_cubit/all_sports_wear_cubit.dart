import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear_repo.dart';

import '../../../../models/Product.dart';

part 'all_sports_wear_state.dart';

class AllSportsWearCubit extends Cubit<AllSportsWearState> {
  AllSportsWearCubit(this.sportsWearRepo) : super(AllSportsWearInitial());
  final SportsWearRepo sportsWearRepo;
  Future<void> getAllWears() async {
    emit(AllSportsWearLoading());
    var result = await sportsWearRepo.getAllSportsWear();
    result.fold(
            (failure) => emit(AllSportsWearFailure(failure.errorMessage)),
            (wears) => emit(AllSportsWearSuccess(wears)));
  }
}
