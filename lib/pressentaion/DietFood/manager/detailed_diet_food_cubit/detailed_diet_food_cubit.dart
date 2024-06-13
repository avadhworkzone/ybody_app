import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/DetailedProduct.dart';
import 'package:x_fitness/pressentaion/DietFood/diet_food_repo.dart';

part 'detailed_diet_food_state.dart';

class DetailedDietFoodCubit extends Cubit<DetailedDietFoodState> {
  DetailedDietFoodCubit(this.dietFoodRepo) : super(DetailedDietFoodInitial());
  final DietFoodRepo dietFoodRepo;

  Future<void> getDetailedDietFood({required int id}) async {
    emit(DetailedDietFoodLoading());
    var result = await dietFoodRepo.getDetailedFood(id: id);
    result.fold(
            (failure) => emit(DetailedDietFoodFailure(failure.errorMessage)),
            (detailedDietFood) =>
            emit(DetailedDietFoodSuccess(detailedDietFood)));
  }
}
