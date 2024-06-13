import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/errors/failures.dart';
import 'package:x_fitness/core/utils/api_service.dart';
import 'package:x_fitness/models/categories/category_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      var data = await apiService.get(endpoint: 'categories');
      List<Category> categories = [];
      for (var category in data['data']) {
        categories.add(Category.fromJson(category));
      }
      print('categories api call${categories}');
      return right(categories);
    } catch (e) {
      print('e is ${e}');
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
