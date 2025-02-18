import 'package:json_annotation/json_annotation.dart';

part 'place_detail_model.g.dart';

@JsonSerializable()
class PlaceDetailModel {
  @JsonKey(name: 'result')
  final PlaceResult result;

  PlaceDetailModel({required this.result});

  factory PlaceDetailModel.fromJson(Map<String, dynamic> json) => _$PlaceDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailModelToJson(this);
}

@JsonSerializable()
class PlaceResult {
  @JsonKey(name: 'geometry')
  final Geometry geometry;

  PlaceResult({required this.geometry});

  factory PlaceResult.fromJson(Map<String, dynamic> json) => _$PlaceResultFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceResultToJson(this);
}

@JsonSerializable()
class Geometry {
  @JsonKey(name: 'location')
  final Location location;

  Geometry({required this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: 'lat')
  final double lat;

  @JsonKey(name: 'lng')
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
