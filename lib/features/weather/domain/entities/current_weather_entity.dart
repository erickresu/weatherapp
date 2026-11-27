import 'package:equatable/equatable.dart';

class CurrentWeatherEntity extends Equatable {
  const CurrentWeatherEntity({
    required this.cityName,
    required this.country,
    required this.dateTime,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.iconCode,
  });

  final String cityName;

  final String country;

  final DateTime dateTime;

  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  final int humidity;

  final int pressure;

  final double windSpeed;

  final String condition;
  final String description;

  final String iconCode;

  @override
  List<Object?> get props => [
    cityName,
    country,
    dateTime,
    temperature,
    feelsLike,
    tempMin,
    tempMax,
    humidity,
    pressure,
    windSpeed,
    condition,
    description,
    iconCode,
  ];
}
