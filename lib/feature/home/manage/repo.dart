// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'package:dio/dio.dart';

class HomeRepo {
  static final Dio _dio = Dio();
  String baseUrl =
      'http://api.weatherapi.com/v1/current.json?key=e1cecef5a4ce4de6832202427230207&q=Cairo&aqi=yes';
      
  Future<dynamic> getHomeData() async {
    try {
      final response = await _dio.get(
        baseUrl,
      );

     //print('this is data became from api: $response.data');
      return response.data;
    } catch (error) {
      print('Error fetching home data: $error');
      throw error;
    }
  }
}
