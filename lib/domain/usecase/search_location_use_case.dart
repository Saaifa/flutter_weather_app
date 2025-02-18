import 'package:flutter_weather_app/domain/repository/location_repository.dart';

class SearchLocationUseCase{
  final LocationRepository _repository;

  SearchLocationUseCase(this._repository);

  Future<dynamic> call(String location, String googleApiKey, String fields) async {
    final response = await _repository.placeAutoComplete(location, googleApiKey, fields);
    return response;
  }
}