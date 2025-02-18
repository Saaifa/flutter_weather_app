import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/data/model/weather_model.dart';
import 'package:flutter_weather_app/data/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  WeatherCubit({required this.repository}) : super(WeatherInitial());

  Future<void> fetchWeather(String latitude, String longitude) async {
    emit(WeatherLoading());
    try {
      final weather = await repository.getWeatherData(latitude, longitude);
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError("Could not fetch weather data"));
    }
  }
}
