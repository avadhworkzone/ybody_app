import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://dev.sanamedia.net/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    print("response.statusCode   ${response.statusCode}");
    print("response.statusCode   ${response}");
    log("response.statusCode   $_baseUrl$endpoint");

    return response.data;
  }

  Future<Map<String, dynamic>> getCategoryById({required int id}) async {
    var response = await _dio.get('${_baseUrl}categories/$id');
    return response.data;
  }

  Future<Map<String, dynamic>> getProductById({required int id}) async {
    var response = await _dio.get('${_baseUrl}products/$id');
    return response.data;
  }

  Future<Map<String, dynamic>> getSubCategoryById({required int id}) async {
    var response = await _dio.get('${_baseUrl}sub-categories/$id');
    return response.data;
  }

  Future<Map<String, dynamic>> getBrandById({required int id}) async {
    var response = await _dio.get('${_baseUrl}brands/$id');
    return response.data;
  }
}
