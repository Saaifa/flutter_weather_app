import 'package:json_annotation/json_annotation.dart';

part 'place_autocomplete_model.g.dart';

@JsonSerializable()
class PlaceAutocompleteModel {
  @JsonKey(name: 'predictions')
  final List<Prediction> predictions;

  PlaceAutocompleteModel({required this.predictions});

  factory PlaceAutocompleteModel.fromJson(Map<String, dynamic> json) => _$PlaceAutocompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceAutocompleteModelToJson(this);
}

@JsonSerializable()
class Prediction {
  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'place_id')
  final String placeId;

  Prediction({required this.description, required this.placeId});

  factory Prediction.fromJson(Map<String, dynamic> json) => _$PredictionFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionToJson(this);
}
