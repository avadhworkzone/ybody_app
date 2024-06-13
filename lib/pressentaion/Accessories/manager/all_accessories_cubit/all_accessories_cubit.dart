import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/Product.dart';
import 'package:x_fitness/pressentaion/Accessories/accessories_repo.dart';

part 'all_accessories_state.dart';

class AllAccessoriesCubit extends Cubit<AllAccessoriesState> {
  AllAccessoriesCubit(this.accessoriesRepo) : super(AllAccessoriesInitial());
  final AccessoriesRepo accessoriesRepo;
  Future<void> getAllAccessories() async {
    emit(AllAccessoriesLoading());
    var result = await accessoriesRepo.getAllAccessories();
    result.fold(
            (failure) => emit(AllAccessoriesFailure(failure.errorMessage)),
            (accessories) => emit(AllAccessoriesSuccess(accessories)));
  }
}
