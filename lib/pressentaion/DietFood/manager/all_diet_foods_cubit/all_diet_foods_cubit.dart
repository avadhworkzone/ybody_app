import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/DietFood/diet_food_repo.dart';

import '../../../../models/Product.dart';

part 'all_diet_foods_state.dart';

class AllDietFoodsCubit extends Cubit<AllDietFoodsState> {
  AllDietFoodsCubit(this.dietFoodRepo) : super(AllDietFoodsInitial());
  final DietFoodRepo dietFoodRepo;
  Future<void> getAllFoods() async {
    emit(AllDietFoodsLoading());
    var result = await dietFoodRepo.getAllFoods();
    result.fold(
            (failure) => emit(AllDietFoodsFailure(failure.errorMessage)),
            (accessories) => emit(AllDietFoodsSuccess(accessories)));
  }
}
