import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/Supplements/supplements_repo.dart';
import '../../../../models/Brand.dart';


part 'supplements_categories_state.dart';

class SupplementsCategoriesCubit extends Cubit<SupplementsCategoriesState> {
  SupplementsCategoriesCubit(this.supplementsRepo) : super(SupplementsCategoriesInitial());
  final SupplementsRepo supplementsRepo;
  Future<void> getSupplementsCategories() async {
    emit(SupplementsCategoriesLoading());
    var result = await supplementsRepo.getSupplementsCategories();
    result.fold(
            (failure) => emit(SupplementsCategoriesFailure(failure.errorMessage)),
            (categories) => emit(SupplementsCategoriesSuccess(categories)));
  }
}
