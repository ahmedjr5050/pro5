import 'dart:convert';
import 'package:dio/dio.dart';

class DetectRepo {
  static final Dio _dio = Dio();
  String baseUrl = 'https://horus-project.onrender.com/predect';

  Future<dynamic> getaiData(String base64Image) async {
    try {
      final response = await _dio.get(baseUrl,
          options: Options(
            contentType: 'application/json',
          ),
          data: {
            'image': base64Image,
          });
      return response.data;
    } catch (error) {
      print('Error fetching AI data: $error');
      rethrow;
    }
  }
}
