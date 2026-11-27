// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastResponseModel _$ForecastResponseModelFromJson(
  Map<String, dynamic> json,
) => _ForecastResponseModel(
  list:
      (json['list'] as List<dynamic>?)
          ?.map((e) => ForecastItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ForecastItemModel>[],
  city: json['city'] == null
      ? const ForecastCityModel()
      : ForecastCityModel.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForecastResponseModelToJson(
  _ForecastResponseModel instance,
) => <String, dynamic>{'list': instance.list, 'city': instance.city};

_ForecastCityModel _$ForecastCityModelFromJson(Map<String, dynamic> json) =>
    _ForecastCityModel(
      name: json['name'] as String? ?? '',
      timezone: (json['timezone'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ForecastCityModelToJson(_ForecastCityModel instance) =>
    <String, dynamic>{'name': instance.name, 'timezone': instance.timezone};

_ForecastItemModel _$ForecastItemModelFromJson(Map<String, dynamic> json) =>
    _ForecastItemModel(
      dt: (json['dt'] as num).toInt(),
      main: WeatherMainModel.fromJson(json['main'] as Map<String, dynamic>),
      weather:
          (json['weather'] as List<dynamic>?)
              ?.map(
                (e) =>
                    WeatherConditionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <WeatherConditionModel>[],
      pop: (json['pop'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ForecastItemModelToJson(_ForecastItemModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'pop': instance.pop,
    };
