import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/DetailedProduct.dart';
import 'package:x_fitness/pressentaion/Supplements/supplements_repo.dart';

part 'detailed_supplement_state.dart';

class DetailedSupplementCubit extends Cubit<DetailedSupplementState> {
  DetailedSupplementCubit(this.supplementsRepo) : super(DetailedSupplementInitial());
  final SupplementsRepo supplementsRepo;
  Future<void> getDetailedSupplement({required int id})async{
    emit(DetailedSupplementLoading());
    var result = await supplementsRepo.getDetailedSupplement(id: id);
    result.fold(
            (failure) => emit(DetailedSupplementFailure(failure.errorMessage)),
            (detailedSupplement) => emit(DetailedSupplementSuccess(detailedSupplement)));
  }
}
