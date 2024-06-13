import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/Product.dart';

import 'package:x_fitness/pressentaion/equilpemnet/equimpments_repo.dart';

part 'all_equipments_state.dart';

class AllEquipmentsCubit extends Cubit<AllEquipmentsState> {
  AllEquipmentsCubit(this.equipmentsRepo) : super(AllEquipmentsInitial());
  final EquipmentsRepo equipmentsRepo;
  Future<void> getAllEquipments() async {
    emit(EquipmentsLoading());
    var result = await equipmentsRepo.getAllEquipments();
    result.fold(
            (failure) => emit(EquipmentsFailure(failure.errorMessage)),
            (equipments) => emit(EquipmentsSuccess(equipments)));
  }
}
