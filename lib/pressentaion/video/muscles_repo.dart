import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/errors/failures.dart';
import 'package:x_fitness/core/utils/api_service.dart';
import 'package:x_fitness/models/muscles/Muscle.dart';
import 'package:x_fitness/models/muscles/MusclePartFile.dart';

class MusclesRepo{
  final ApiService apiService;

  MusclesRepo(this.apiService);

  Future<Either<Failure, List<Muscle>>> getAllMuscles()async{
    try {
      var data = await apiService.get(endpoint: 'muscles');
      List<Muscle> muscles = [];
      for(var muscle in data['data']){
        muscles.add(Muscle.fromJson(muscle));
      }
      return right(muscles);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  Future<Either<Failure, List<MusclePartFile>>> getPartFiles({required int muscleId,required int partId})async{
    try {
      var data = await apiService.get(endpoint: 'muscles/$muscleId/$partId/files');
      List<MusclePartFile> files = [];
      for(var file in data['data']){
        files.add(MusclePartFile.fromJson(file));
      }
      return right(files);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}