import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/SubCategory.dart';
import 'package:x_fitness/pressentaion/DietFood/diet_food_repo.dart';

part 'filtered_foods_state.dart';

class FilteredFoodsCubit extends Cubit<FilteredFoodsState> {
  FilteredFoodsCubit(this.dietFoodRepo) : super(FilteredFoodsInitial());
  final DietFoodRepo dietFoodRepo;
  Future<void> getSubCategoryData({required int id}) async {
    emit(FilteredFoodsLoading());
    var result = await dietFoodRepo.getFilteredFoods(id: id);
    result.fold(
            (failure) => emit(FilteredFoodsFailure(failure.errorMessage)),
            (subCategoryData) => emit(FilteredFoodsSuccess(subCategoryData)));
  }
}
