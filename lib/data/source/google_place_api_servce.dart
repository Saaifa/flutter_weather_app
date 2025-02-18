
import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/api/api_constants.dart';

class GooglePlaceApiService{
  final Dio _dio = Dio();
  final String _baseUrl = ApiConstants.GOOGLE_BASEURL;
  final String _apiKey = ApiConstants.GOOGLE_API_KEY;

  Future<Map<String, dynamic>> searchPlace(String location) async {
    final response =  await _dio.get("https://maps.googleapis.com/maps/api/place/queryautocomplete/json?input=bhuj&"
        "key=$_apiKey&fields=address_component");
    return response.data;


  }

  Future<Map<String, dynamic>> placeDetail(String location) async {
    final response =  await _dio.get("https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJF28LAAniUDkRpnQHr1jzd3A&"
        "key=$_apiKey&fields=geometry");
    return response.data;


  }
}