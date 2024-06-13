import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/errors/failures.dart';
import 'package:x_fitness/core/utils/api_service.dart';
import 'package:x_fitness/models/DetailedProduct.dart';
import 'package:x_fitness/models/Product.dart';
import 'package:x_fitness/models/SubCategory.dart';

class EquipmentsRepo{
  final ApiService apiService;

  EquipmentsRepo(this.apiService);

  Future<Either<Failure, List<Product>>> getAllEquipments()async{
    try {
      var data = await apiService.getCategoryById(id: 1);
      List<Product> equipments = [];
      for(var equipment in data['data']['products']){
        equipments.add(Product.fromJson(equipment));
      }
      return right(equipments);
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
  Future<Either<Failure, List<SubCategory>>> getEquipmentsCategories()async{
    try {
      var data = await apiService.getCategoryById(id: 1);
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

  Future<Either<Failure, DetailedProduct>> getDetailedEquipment({required int id})async{
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
  Future<Either<Failure, SubCategory>> getFilteredEquipments({required int id})async{
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
