import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:x_fitness/core/utils/api_service.dart';

import '../../core/errors/failures.dart';
import '../../models/Brand.dart';
import '../../models/DetailedProduct.dart';
import '../../models/Product.dart';

class SupplementsRepo{
  final ApiService apiService;

  SupplementsRepo(this.apiService);
  Future<Either<Failure, List<Product>>> getSupplements()async{
    try {
      var data = await apiService.getCategoryById(id: 6);
      List<Product> supplements = [];
      for(var supplement in data['data']['products']){
        supplements.add(Product.fromJson(supplement));
      }
      return right(supplements);
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
  Future<Either<Failure, List<Brand>>> getSupplementsCategories()async{
    try {
      var data = await apiService.getCategoryById(id: 6);
      List<Brand> brands = [];
      for(var subCategory in data['data']['brands']){
        brands.add(Brand.fromJson(subCategory));
      }
      return right(brands);
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

  Future<Either<Failure, DetailedProduct>> getDetailedSupplement({required int id})async{
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
  Future<Either<Failure, Brand>> getFilteredSupplements({required int id})async{
    try {
      var data = await apiService.getBrandById(id: id);
      Brand brand = Brand.fromJson(data['data']);
      return right(brand);
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