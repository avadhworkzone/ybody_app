import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/utils/api_service.dart';

import '../../core/errors/failures.dart';
import '../../models/DetailedProduct.dart';
import '../../models/Product.dart';
import '../../models/SubCategory.dart';

class SportsWearRepo{
  final ApiService apiService;

  SportsWearRepo(this.apiService);
  Future<Either<Failure, List<Product>>> getAllSportsWear()async{
    try {
      var data = await apiService.getCategoryById(id: 3);
      List<Product> wears = [];
      for(var wear in data['data']['products']){
        wears.add(Product.fromJson(wear));
      }
      return right(wears);
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
  Future<Either<Failure, List<SubCategory>>> getSportsWearCategories()async{
    try {
      var data = await apiService.getCategoryById(id: 3);
      List<SubCategory> subCategories = [];
      for(var subCategory in data['data']['subcategories']){
        subCategories.add(SubCategory.fromJson(subCategory));
      }
      return right(subCategories);
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

  Future<Either<Failure, DetailedProduct>> getDetailedSportsWear({required int id})async{
    try {
      var data = await apiService.getProductById(id: id);
      DetailedProduct product = DetailedProduct.fromJson(data['data']);
      return right(product);
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
  Future<Either<Failure, SubCategory>> getFilteredSportsWear({required int id})async{
    try {
      var data = await apiService.getSubCategoryById(id: id);
      SubCategory subCategory = SubCategory.fromJson(data['data']);
      return right(subCategory);
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