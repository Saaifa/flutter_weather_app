import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/error/error_logger.dart';
import 'package:flutter_weather_app/data/model/place_autocomplete_model.dart';
import 'package:flutter_weather_app/data/model/place_detail_model.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_weather_app/core/api/api_constants.dart';

part 'google_place_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.GOOGLE_BASEURL)
abstract class GooglePlaceApiService {
  factory GooglePlaceApiService(Dio dio, {String baseUrl}) = _GooglePlaceApiService;

  @GET("details/json")
  Future<PlaceDetailModel> getPlaceDetails(
      @Query("place_id") String placeId,
      @Query("key") String googleApiKey,
      @Query("fields") String fields,
      );

  @GET("autocomplete/json")
  Future<PlaceAutocompleteModel> placeAutoComplete(
      @Query("input") String input,
      @Query("key") String googleApiKey,
      @Query("types") String types,
      );

  @GET("geocode/json")
  Future<dynamic> getLocationFromLatLng(
      @Query("latlng") String latlng,
      @Query("key") String googleApiKey,
      );
}
