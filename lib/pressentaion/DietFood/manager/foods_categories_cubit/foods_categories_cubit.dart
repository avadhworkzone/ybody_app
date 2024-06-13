import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/DietFood/diet_food_repo.dart';

import '../../../../models/SubCategory.dart';

part 'foods_categories_state.dart';

class FoodsCategoriesCubit extends Cubit<FoodsCategoriesState> {
  FoodsCategoriesCubit(this.dietFoodRepo) : super(FoodsCategoriesInitial());
  final DietFoodRepo dietFoodRepo;
  Future<void> getFoodsCategories() async {
    emit(FoodsCategoriesLoading());
    var result = await dietFoodRepo.getFoodsCategories();
    result.fold(
            (failure) => emit(FoodsCategoriesFailure(failure.errorMessage)),
            (categories) => emit(FoodsCategoriesSuccess(categories)));
  }
}
