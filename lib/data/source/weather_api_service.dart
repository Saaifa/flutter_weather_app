
import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/api/api_constants.dart';

class WeatherApiService{
  final Dio _dio = Dio();
  final String _baseUrl = ApiConstants.WEATHER_BASEURL;
  final String _apiKey = ApiConstants.WEATHER_API_KEY;

  Future<Map<String, dynamic>> getWeatherData(String latitude, String longitude) async {
    final response =  await _dio.get("$_baseUrl?lat=23.2419997&lon=69.66693239999999&appid="API_KEY");
    return response.data;
  }
}
