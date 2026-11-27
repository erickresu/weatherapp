// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    _CurrentWeatherModel(
      name: json['name'] as String,
      dt: (json['dt'] as num).toInt(),
      timezone: (json['timezone'] as num?)?.toInt() ?? 0,
      main: WeatherMainModel.fromJson(json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? const WindModel()
          : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      weather:
          (json['weather'] as List<dynamic>?)
              ?.map(
                (e) =>
                    WeatherConditionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <WeatherConditionModel>[],
      sys: json['sys'] == null
          ? const CurrentWeatherSysModel()
          : CurrentWeatherSysModel.fromJson(
              json['sys'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
  _CurrentWeatherModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'dt': instance.dt,
  'timezone': instance.timezone,
  'main': instance.main,
  'wind': instance.wind,
  'weather': instance.weather,
  'sys': instance.sys,
};

_CurrentWeatherSysModel _$CurrentWeatherSysModelFromJson(
  Map<String, dynamic> json,
) => _CurrentWeatherSysModel(country: json['country'] as String?);

Map<String, dynamic> _$CurrentWeatherSysModelToJson(
  _CurrentWeatherSysModel instance,
) => <String, dynamic>{'country': instance.country};
