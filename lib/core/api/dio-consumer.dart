import 'package:dio/dio.dart';
import 'package:eventa_project/core/api/api_consumer.dart';
import 'package:eventa_project/core/api/api_interceptors.dart';
import 'package:eventa_project/core/api/end_ponits.dart';
import 'package:eventa_project/core/errors/exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl =EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());//شرطي مرور براقب الركوست وهوا رايح وهوا جاي 
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true));//لطباعة معلومات الركويست
  }
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFromData = false}) async {
    try {
      final response = await dio.delete(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameter);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFromData = false}) async {
    try {
      final response = await dio.patch(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFromData = false}) async {
    try {
      final response = await dio.post(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter);
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }
}
