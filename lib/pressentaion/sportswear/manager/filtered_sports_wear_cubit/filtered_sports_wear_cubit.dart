import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/SubCategory.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear_repo.dart';

part 'filtered_sports_wear_state.dart';

class FilteredSportsWearCubit extends Cubit<FilteredSportsWearState> {
  FilteredSportsWearCubit(this.sportsWearRepo) : super(FilteredSportsWearInitial());
  final SportsWearRepo sportsWearRepo;
  Future<void> getSubCategoryData({required int id}) async {
    emit(FilteredSportsWearLoading());
    var result = await sportsWearRepo.getFilteredSportsWear(id: id);
    result.fold(
            (failure) => emit(FilteredSportsWearFailure(failure.errorMessage)),
            (subCategoryData) => emit(FilteredSportsWearSuccess(subCategoryData)));
  }
}
