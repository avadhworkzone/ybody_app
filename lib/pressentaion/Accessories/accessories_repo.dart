import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/utils/api_service.dart';
import 'package:x_fitness/models/SubCategory.dart';

import '../../core/errors/failures.dart';
import '../../models/DetailedProduct.dart';
import '../../models/Product.dart';

class AccessoriesRepo{
  final ApiService apiService;

  AccessoriesRepo(this.apiService);

  Future<Either<Failure, List<Product>>> getAllAccessories()async{
    try {
      var data = await apiService.getCategoryById(id: 2);
      List<Product> accessories = [];
      for(var accessory in data['data']['products']){
        accessories.add(Product.fromJson(accessory));
      }
      return right(accessories);
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
  Future<Either<Failure, List<SubCategory>>> getAccessoriesCategories()async{
    try {
      var data = await apiService.getCategoryById(id: 2);
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

  Future<Either<Failure, DetailedProduct>> getDetailedAccessory({required int id})async{
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
  Future<Either<Failure, SubCategory>> getFilteredAccessories({required int id})async{
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