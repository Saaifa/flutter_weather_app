import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/api/api_constants.dart';
import 'package:flutter_weather_app/data/repositories/location_repository.dart';
import 'package:flutter_weather_app/domain/usecase/place_detail_use_case.dart';
import 'package:flutter_weather_app/domain/usecase/search_location_use_case.dart';
import 'package:meta/meta.dart';

import '../../../data/source/google_place_api_servce.dart';

// import '../../../data/source/google_place_api_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {

  final PlaceDetailUseCase placeDetail;
  LocationCubit(this.placeDetail) : super(LocationInitial());

  Future<dynamic> placeAutoComplete(String location) async{
    final GooglePlaceApiService _GooglePlaceApiService = GooglePlaceApiService();
    print("locationCubit: $location");
    emit(LocationLoading());
    try{
      final response = await _GooglePlaceApiService.searchPlace(location);

      List<dynamic> predictions = response["predictions"];
      print("response of sdknknskdjfnosdf: $predictions");
      // if(predictions.isNotEmpty) {
      emit(LocationSuccess(predictions));
      // }else{
      //   // Logger.getInstance().logInfo("LocationSuccess Cubit", "${response.message}");
      //   emit(LocationError("No data available"));
      // }
    }
    catch(e){
      emit(LocationError("Location Error : $e"));
    }
  }

  Future<dynamic> getPlaceDetails(String placeId) async{
    emit(PlaceDetailLoading());
    try{
      final response = await placeDetail(placeId, ApiConstants.GOOGLE_API_KEY, ApiConstants.PLACE_DETAIL_FIELD);
      dynamic placeDetailResponse = response["result"];
      // Logger.getInstance().logInfo("PlaceDetail Response Cubit", "${response['result']}");
      if(placeDetailResponse.isNotEmpty){
        emit(PlaceDetailSuccess(placeDetailResponse));
      }
      else{
        emit(PlaceDetailError(response.message));
      }
    }
    catch(e){
      emit(PlaceDetailError('Place Details Error: $e'));
    }
  }
}
