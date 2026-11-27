import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_parts_model.freezed.dart';
part 'weather_parts_model.g.dart';

@freezed
abstract class WeatherConditionModel with _$WeatherConditionModel {
  const factory WeatherConditionModel({
    @Default('') String main,
    @Default('') String description,
    @Default('01d') String icon,
  }) = _WeatherConditionModel;

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionModelFromJson(json);
}

@freezed
abstract class WeatherMainModel with _$WeatherMainModel {
  const factory WeatherMainModel({
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
    @Default(0) int humidity,
    @Default(0) int pressure,
  }) = _WeatherMainModel;

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainModelFromJson(json);
}

@freezed
abstract class WindModel with _$WindModel {
  const factory WindModel({@Default(0) double speed}) = _WindModel;

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
}

/// City wall-clock time, kept as UTC so the phone's time zone never shifts it.
DateTime cityLocalTime(int unixSeconds, int offsetSeconds) =>
    DateTime.fromMillisecondsSinceEpoch(
      (unixSeconds + offsetSeconds) * 1000,
      isUtc: true,
    );
