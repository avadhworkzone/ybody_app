import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/DetailedProduct.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear_repo.dart';

part 'detailed_sports_wear_state.dart';

class DetailedSportsWearCubit extends Cubit<DetailedSportsWearState> {
  DetailedSportsWearCubit(this.sportsWearRepo) : super(DetailedSportsWearInitial());
  final SportsWearRepo sportsWearRepo;
  Future<void> getDetailedSportsWear({required int id})async{
    emit(DetailedSportsWearLoading());
    var result = await sportsWearRepo.getDetailedSportsWear(id: id);
    result.fold(
            (failure) => emit(DetailedSportsWearFailure(failure.errorMessage)),
            (detailedSportsWear) => emit(DetailedSportsWearSuccess(detailedSportsWear)));
}
}
