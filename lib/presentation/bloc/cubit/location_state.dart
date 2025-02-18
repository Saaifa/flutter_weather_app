part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

class LocationLoading extends LocationState{}

class LocationSuccess extends LocationState{
  final dynamic response;
  LocationSuccess(this.response);
}

class LocationError extends LocationState{
  final String message;
  LocationError(this.message);
}

class PlaceDetailLoading extends LocationState{}

class PlaceDetailSuccess extends LocationState{
  final dynamic response;
  PlaceDetailSuccess(this.response);
}

class PlaceDetailError extends LocationState{
  final String message;
  PlaceDetailError(this.message);
}
