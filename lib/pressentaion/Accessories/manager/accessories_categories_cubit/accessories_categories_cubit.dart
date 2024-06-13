import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/SubCategory.dart';
import 'package:x_fitness/pressentaion/Accessories/accessories_repo.dart';

part 'accessories_categories_state.dart';

class AccessoriesCategoriesCubit extends Cubit<AccessoriesCategoriesState> {
  AccessoriesCategoriesCubit(this.accessoriesRepo) : super(AccessoriesCategoriesInitial());
  final AccessoriesRepo accessoriesRepo;
  Future<void> getAccessoriesCategories() async {
    emit(AccessoriesCategoriesLoading());
    var result = await accessoriesRepo.getAccessoriesCategories();
    result.fold(
            (failure) => emit(AccessoriesCategoriesFailure(failure.errorMessage)),
            (categories) => emit(AccessoriesCategoriesSuccess(categories)));
  }
}
