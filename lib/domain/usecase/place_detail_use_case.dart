import 'package:flutter_weather_app/domain/repository/location_repository.dart';

class PlaceDetailUseCase{
  final LocationRepository _repository;

  PlaceDetailUseCase(this._repository);

  Future<dynamic> call(String placeId, String googleApiKey, String fields) async{
    final response = await _repository.getPlaceDetail(placeId, googleApiKey, fields);
    return response;
  }
}