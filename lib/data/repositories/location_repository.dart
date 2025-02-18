
import 'package:flutter_weather_app/data/model/place_autocomplete_model.dart';
import 'package:flutter_weather_app/data/model/place_detail_model.dart';
import 'package:flutter_weather_app/data/source/google_place_api_service.dart';
import 'package:flutter_weather_app/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository{
  final GooglePlaceApiService _apiService;

  LocationRepositoryImpl(this._apiService);

  @override
  Future<dynamic> getPlaceDetail(String placeId, String googleApiKey, String fields) async{
    final response = await _apiService.getPlaceDetails(
        placeId,
        googleApiKey,
        fields);
    return response;
  }

  @override
  Future placeAutoComplete(String location, String googleApiKey, String fields) async{
    final response = await _apiService.placeAutoComplete(location, googleApiKey, fields);
    return response;
  }
}
