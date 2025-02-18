import 'package:flutter_weather_app/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity{
  WeatherModel({required super.cityName,
    required super.temperature,
    required super.description,
    required super.humidity,
    required super.windSpeed});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json['cityName'],
        temperature: json['main']['temp'].toDouble(),
        description: json['weather'][0]['description'],
        humidity: json['humidity'].toInt(),
        windSpeed: json['windSpeed'].toDouble());
  }
}