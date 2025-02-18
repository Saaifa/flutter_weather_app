import 'package:flutter_weather_app/data/model/weather_model.dart';
import 'package:flutter_weather_app/data/source/weather_api_service.dart';

class WeatherRepository{
   final WeatherApiService apiService;

   WeatherRepository(this.apiService);

  Future<dynamic> getWeatherData(String latitude, String longitude) async {
     final data = await apiService.getWeatherData(latitude, longitude);
     return WeatherModel.fromJson(data);
  }

}