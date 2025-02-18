import 'package:flutter_weather_app/core/api/api_constants.dart';
import 'package:flutter_weather_app/data/model/weather_model.dart';
import 'package:flutter_weather_app/data/repositories/weather_repository.dart';

class WeatherUseCase{
  final WeatherRepository repository;
  WeatherUseCase(this.repository);

  Future<dynamic> execute(String latitude, String longitude) async {
    return repository.getWeatherData(latitude, longitude);
  }
}