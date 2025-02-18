// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_autocomplete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceAutocompleteModel _$PlaceAutocompleteModelFromJson(
        Map<String, dynamic> json) =>
    PlaceAutocompleteModel(
      predictions: (json['predictions'] as List<dynamic>)
          .map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaceAutocompleteModelToJson(
        PlaceAutocompleteModel instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
    };

Prediction _$PredictionFromJson(Map<String, dynamic> json) => Prediction(
      description: json['description'] as String,
      placeId: json['place_id'] as String,
    );

Map<String, dynamic> _$PredictionToJson(Prediction instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.placeId,
    };
