import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:x_fitness/models/DetailedProduct.dart';
import 'package:x_fitness/pressentaion/equilpemnet/equimpments_repo.dart';

part 'detailed_equipment_state.dart';

class DetailedEquipmentCubit extends Cubit<DetailedEquipmentState> {
  DetailedEquipmentCubit(this.equipmentsRepo) : super(DetailedEquipmentInitial());
  final EquipmentsRepo equipmentsRepo;

  Future<void> getDetailedEquipment({required int id})async{
    emit(DetailedEquipmentLoading());
    var result = await equipmentsRepo.getDetailedEquipment(id: id);
    result.fold(
            (failure) => emit(DetailedEquipmentFailure(failure.errorMessage)),
            (detailedEquipment) => emit(DetailedEquipmentSuccess(detailedEquipment)));
  }
}
