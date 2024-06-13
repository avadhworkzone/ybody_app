import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/SubCategory.dart';
import 'package:x_fitness/pressentaion/equilpemnet/equimpments_repo.dart';

part 'equipments_categories_state.dart';

class EquipmentsCategoriesCubit extends Cubit<EquipmentsCategoriesState> {
  EquipmentsCategoriesCubit(this.equipmentsRepo) : super(EquipmentsCategoriesInitial());
  final EquipmentsRepo equipmentsRepo;
  Future<void> getEquipmentsCategories() async {
    emit(EquipmentsCategoriesLoading());
    var result = await equipmentsRepo.getEquipmentsCategories();
    result.fold(
            (failure) => emit(EquipmentsCategoriesFailure(failure.errorMessage)),
            (categories) => emit(EquipmentsCategoriesSuccess(categories)));
  }

}

