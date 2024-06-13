import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/pressentaion/Supplements/supplements_repo.dart';

import '../../../../models/Product.dart';

part 'all_supplements_state.dart';

class AllSupplementsCubit extends Cubit<AllSupplementsState> {
  AllSupplementsCubit(this.supplementsRepo) : super(AllSupplementsInitial());
  final SupplementsRepo supplementsRepo;
  Future<void> getAllSupplements() async {
    emit(AllSupplementsLoading());
    var result = await supplementsRepo.getSupplements();
    result.fold(
            (failure) => emit(AllSupplementsFailure(failure.errorMessage)),
            (supplements) => emit(AllSupplementsSuccess(supplements)));
  }
}
