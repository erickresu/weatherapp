// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_parts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherConditionModel _$WeatherConditionModelFromJson(
  Map<String, dynamic> json,
) => _WeatherConditionModel(
  main: json['main'] as String? ?? '',
  description: json['description'] as String? ?? '',
  icon: json['icon'] as String? ?? '01d',
);

Map<String, dynamic> _$WeatherConditionModelToJson(
  _WeatherConditionModel instance,
) => <String, dynamic>{
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

_WeatherMainModel _$WeatherMainModelFromJson(Map<String, dynamic> json) =>
    _WeatherMainModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      humidity: (json['humidity'] as num?)?.toInt() ?? 0,
      pressure: (json['pressure'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WeatherMainModelToJson(_WeatherMainModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
    };

_WindModel _$WindModelFromJson(Map<String, dynamic> json) =>
    _WindModel(speed: (json['speed'] as num?)?.toDouble() ?? 0);

Map<String, dynamic> _$WindModelToJson(_WindModel instance) =>
    <String, dynamic>{'speed': instance.speed};
