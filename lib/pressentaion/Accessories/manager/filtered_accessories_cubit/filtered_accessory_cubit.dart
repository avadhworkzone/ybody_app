import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/SubCategory.dart';
import 'package:x_fitness/pressentaion/Accessories/accessories_repo.dart';

part 'filtered_accessory_state.dart';

class FilteredAccessoryCubit extends Cubit<FilteredAccessoryState> {
  FilteredAccessoryCubit(this.accessoriesRepo) : super(FilteredAccessoryInitial());
  final AccessoriesRepo accessoriesRepo;
  Future<void> getSubCategoryData({required int id}) async {
    emit(FilteredAccessoryLoading());
    var result = await accessoriesRepo.getFilteredAccessories(id: id);
    result.fold(
            (failure) => emit(FilteredAccessoryFailure(failure.errorMessage)),
            (subCategoryData) => emit(FilteredAccessorySuccess(subCategoryData)));
  }
}
