import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai/core/network/api_keys.dart';


class ApiService {
  final Dio _dio;
  final String _baseUrl = 'https://api.openai.com/v1/';


  final String lang = 'en';

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
    @required Map<String, dynamic>? data,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$urlEndPoint',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.apiKey}',
          'Content-Type': 'application/json',
        },
      ),
      queryParameters: queryParameters,
      data: data,
    );
    return response.data;
  }


}
