// import 'package:dio/dio.dart';
// import 'package:flutter_weather_app/core/api/api_constants.dart';
// import 'package:flutter_weather_app/data/model/weather_model.dart';
// import 'package:retrofit/http.dart';
//
// @RestApi(baseUrl: WeatherApi.WEATHER_BASEURL)
//
// abstract class WeatherApiService{
//   factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;
//
//   @GET("")
//   Future<WeatherModel> getWeatherData(
//       @Query("") int
//       );
// }

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/api/api_constants.dart';

class WeatherApiService{
  final Dio _dio = Dio();
  final String _baseUrl = ApiConstants.WEATHER_BASEURL;
  final String _apiKey = ApiConstants.WEATHER_API_KEY;

  Future<Map<String, dynamic>> getWeatherData(String latitude, String longitude) async {
    final response =  await _dio.get("$_baseUrl?lat=23.2419997&lon=69.66693239999999&appid=86c4884a76c4e8202ebc53f968594588");
    return response.data;
  }
}