import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/api_service.dart';
import '../../models/DetailedProduct.dart';
import '../../models/Product.dart';
import '../../models/SubCategory.dart';

class DietFoodRepo{
  final ApiService apiService;

  DietFoodRepo(this.apiService);

  Future<Either<Failure, List<Product>>> getAllFoods()async{
    try {
      var data = await apiService.getCategoryById(id: 4);
      List<Product> foods = [];
      for(var food in data['data']['products']){
        foods.add(Product.fromJson(food));
      }
      return right(foods);
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
  Future<Either<Failure, List<SubCategory>>> getFoodsCategories()async{
    try {
      var data = await apiService.getCategoryById(id: 4);
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

  Future<Either<Failure, DetailedProduct>> getDetailedFood({required int id})async{
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
  Future<Either<Failure, SubCategory>> getFilteredFoods({required int id})async{
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