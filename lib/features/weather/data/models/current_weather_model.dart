import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/current_weather_entity.dart';
import 'weather_parts_model.dart';

part 'current_weather_model.freezed.dart';
part 'current_weather_model.g.dart';

@freezed
abstract class CurrentWeatherModel with _$CurrentWeatherModel {
  const CurrentWeatherModel._();

  const factory CurrentWeatherModel({
    required String name,
    required int dt,
    @Default(0) int timezone,
    required WeatherMainModel main,
    @Default(WindModel()) WindModel wind,
    @Default(<WeatherConditionModel>[]) List<WeatherConditionModel> weather,
    @Default(CurrentWeatherSysModel()) CurrentWeatherSysModel sys,
  }) = _CurrentWeatherModel;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  CurrentWeatherEntity toEntity() {
    final condition = weather.isNotEmpty
        ? weather.first
        : const WeatherConditionModel();
    return CurrentWeatherEntity(
      cityName: name,
      country: sys.country ?? '',
      dateTime: cityLocalTime(dt, timezone),
      temperature: main.temp,
      feelsLike: main.feelsLike,
      tempMin: main.tempMin,
      tempMax: main.tempMax,
      humidity: main.humidity,
      pressure: main.pressure,
      windSpeed: wind.speed,
      condition: condition.main,
      description: condition.description,
      iconCode: condition.icon,
    );
  }
}

@freezed
abstract class CurrentWeatherSysModel with _$CurrentWeatherSysModel {
  const factory CurrentWeatherSysModel({String? country}) =
      _CurrentWeatherSysModel;

  factory CurrentWeatherSysModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherSysModelFromJson(json);
}
