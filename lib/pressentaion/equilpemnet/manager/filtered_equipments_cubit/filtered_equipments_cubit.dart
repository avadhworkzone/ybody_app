import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/SubCategory.dart';
import 'package:x_fitness/pressentaion/equilpemnet/equimpments_repo.dart';

part 'filtered_equipments_state.dart';

class FilteredEquipmentsCubit extends Cubit<FilteredEquipmentsState> {
  FilteredEquipmentsCubit(this.equipmentsRepo)
      : super(FilteredEquipmentsInitial());
  final EquipmentsRepo equipmentsRepo;
  Future<void> getSubCategoryData({required int id}) async {
    emit(FilteredEquipmentsLoading());
    var result = await equipmentsRepo.getFilteredEquipments(id: id);
    result.fold(
        (failure) => emit(FilteredEquipmentsFailure(failure.errorMessage)),
        (subCategoryData) => emit(FilteredEquipmentsSuccess(subCategoryData)));
  }
}
