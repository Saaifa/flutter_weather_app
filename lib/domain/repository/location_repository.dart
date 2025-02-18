abstract class LocationRepository{
  Future<dynamic> getPlaceDetail(String placeId, String googleApiKey, String fields);

  Future<dynamic>placeAutoComplete(String location, String googleApiKey, String fields);


}