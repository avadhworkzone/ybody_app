import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear_repo.dart';

import '../../../../models/SubCategory.dart';

part 'sports_wear_categories_state.dart';

class SportsWearCategoriesCubit extends Cubit<SportsWearCategoriesState> {
  SportsWearCategoriesCubit(this.sportsWearRepo) : super(SportsWearCategoriesInitial());
  final SportsWearRepo sportsWearRepo;
  Future<void> getWearsCategories() async {
    emit(SportsWearCategoriesLoading());
    var result = await sportsWearRepo.getSportsWearCategories();
    result.fold(
            (failure) => emit(SportsWearCategoriesFailure(failure.errorMessage)),
            (categories) => emit(SportsWearCategoriesSuccess(categories)));
  }
}
