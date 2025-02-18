import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/core/api/api_constants.dart';
import 'package:flutter_weather_app/domain/usecase/place_detail_use_case.dart';
import 'package:flutter_weather_app/domain/usecase/search_location_use_case.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {

  final SearchLocationUseCase searchLocation;
  final PlaceDetailUseCase placeDetail;
  LocationCubit(this.searchLocation, this.placeDetail) : super(LocationInitial());

  Future<dynamic> placeAutoComplete(String location) async{
    print("locationCubit: $location");
    emit(LocationLoading());
    try{
      final response = await searchLocation(location, ApiConstants.GOOGLE_API_KEY, ApiConstants.PLACE_AUTOCOMPLETE_FIELD);
      // Map<String, dynamic> jsonMap = jsonDecode(response.toString());
      // Logger.getInstance().logInfo("LocationSuccess Cubit", "${response["predictions"]}");
      List<dynamic> predictions = response["predictions"];
      print("response of sdknknskdjfnosdf: $predictions");
      // if(predictions.isNotEmpty) {
      emit(LocationSuccess(predictions));
      // }else{
      //   // Logger.getInstance().logInfo("LocationSuccess Cubit", "${response.message}");
      //   emit(LocationError("No data available"));
      // }
      // Logger.getInstance().logInfo("LocationSuccess Cubit", "$response");
      // if(response == null){
      //   emit(LocationError("NO location available"));
      // }
    }
    catch(e){
      // Logger.getInstance().logInfo("LocationSuccess Cubit", "$e");
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
