import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/errors/failures.dart';
import 'package:x_fitness/core/utils/api_service.dart';
import 'package:x_fitness/models/Coach.dart';

class CoachesRepo{
  final ApiService apiService;

  CoachesRepo(this.apiService);
  Future<Either<Failure,List<Coach>>> getAllCoaches()async{
    try {
      var data = await apiService.getCategoryById(id: 5);
      List<Coach> coaches = [];
      for(var coach in data['data']['coaches']){
        coaches.add(Coach.fromJson(coach));
      }
      return right(coaches);
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