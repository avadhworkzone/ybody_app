import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/utils/api_service.dart';
import 'package:x_fitness/models/Gym.dart';

import '../../core/errors/failures.dart';

class GymsRepo{
  final ApiService apiService;

  GymsRepo(this.apiService);
  Future<Either<Failure,List<Gym>>> getAllGyms()async{
    try {
      var data = await apiService.get(endpoint: 'gyms');
      List<Gym> gyms = [];
      for(var gym in data['data']){
        gyms.add(Gym.fromJson(gym));
      }
      return right(gyms);
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