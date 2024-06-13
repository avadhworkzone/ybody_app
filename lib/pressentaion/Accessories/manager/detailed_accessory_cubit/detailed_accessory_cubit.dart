import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:x_fitness/models/DetailedProduct.dart';
import 'package:x_fitness/pressentaion/Accessories/accessories_repo.dart';

part 'detailed_accessory_state.dart';

class DetailedAccessoryCubit extends Cubit<DetailedAccessoryState> {
  DetailedAccessoryCubit(this.accessoriesRepo) : super(DetailedAccessoryInitial());
  final AccessoriesRepo accessoriesRepo;
  Future<void> getDetailedAccessory({required int id})async{
    emit(DetailedAccessoryLoading());
    var result = await accessoriesRepo.getDetailedAccessory(id: id);
    result.fold(
            (failure) => emit(DetailedAccessoryFailure(failure.errorMessage)),
            (detailedAccessory) => emit(DetailedAccessorySuccess(detailedAccessory)));
  }
}
