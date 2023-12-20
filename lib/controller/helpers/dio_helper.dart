import 'package:dio/dio.dart';

import '../../../core/constants/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postDataAPI({
    required String url,
    Map<String, dynamic>? query,
    data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    return await dio!.post(url, data: data, queryParameters: query);
  }

  static Future<Response> putDataAPI({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "bearer $token",
    };

    return await dio!.put(url, data: data, queryParameters: query);
  }

  static Future<Response> patchDataAPI({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "bearer $token",
    };

    return await dio!.patch(url, data: data, queryParameters: query);
  }

  static Future<Response> deleteDataAPI({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "bearer $token",
    };

    return await dio!.delete(url, queryParameters: query);
  }

  static Future<Response> getDataAPI({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio!.get(url, queryParameters: query, data: data);
  }
}
