import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/Supplements/supplements_repo.dart';
import '../../../../models/Brand.dart';

part 'filtered_supplements_state.dart';

class FilteredSupplementsCubit extends Cubit<FilteredSupplementsState> {
  FilteredSupplementsCubit(this.supplementsRepo) : super(FilteredSupplementsInitial());
  final SupplementsRepo supplementsRepo;
  Future<void> getSubCategoryData({required int id}) async {
    emit(FilteredSupplementsLoading());
    var result = await supplementsRepo.getFilteredSupplements(id: id);
    result.fold(
            (failure) => emit(FilteredSupplementsFailure(failure.errorMessage)),
            (subCategoryData) => emit(FilteredSupplementsSuccess(subCategoryData)));
  }
}
