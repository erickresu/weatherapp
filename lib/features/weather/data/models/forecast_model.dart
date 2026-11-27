import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/forecast_entry_entity.dart';
import 'weather_parts_model.dart';

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

@freezed
abstract class ForecastResponseModel with _$ForecastResponseModel {
  const ForecastResponseModel._();

  const factory ForecastResponseModel({
    @Default(<ForecastItemModel>[]) List<ForecastItemModel> list,
    @Default(ForecastCityModel()) ForecastCityModel city,
  }) = _ForecastResponseModel;

  factory ForecastResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseModelFromJson(json);

  List<ForecastEntryEntity> toEntities() => [
    for (final item in list) item.toEntity(city.timezone),
  ];
}

@freezed
abstract class ForecastCityModel with _$ForecastCityModel {
  const factory ForecastCityModel({
    @Default('') String name,
    @Default(0) int timezone,
  }) = _ForecastCityModel;

  factory ForecastCityModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastCityModelFromJson(json);
}

@freezed
abstract class ForecastItemModel with _$ForecastItemModel {
  const ForecastItemModel._();

  const factory ForecastItemModel({
    required int dt,
    required WeatherMainModel main,
    @Default(<WeatherConditionModel>[]) List<WeatherConditionModel> weather,
    @Default(0) double pop,
  }) = _ForecastItemModel;

  factory ForecastItemModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemModelFromJson(json);

  ForecastEntryEntity toEntity(int timezoneOffsetSeconds) {
    final condition = weather.isNotEmpty
        ? weather.first
        : const WeatherConditionModel();
    return ForecastEntryEntity(
      dateTime: cityLocalTime(dt, timezoneOffsetSeconds),
      temperature: main.temp,
      tempMin: main.tempMin,
      tempMax: main.tempMax,
      description: condition.description,
      iconCode: condition.icon,
      precipitationChance: pop,
    );
  }
}
