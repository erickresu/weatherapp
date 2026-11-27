import 'package:equatable/equatable.dart';

class ForecastEntryEntity extends Equatable {
  const ForecastEntryEntity({
    required this.dateTime,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.description,
    required this.iconCode,
    required this.precipitationChance,
  });

  final DateTime dateTime;

  final double temperature;
  final double tempMin;
  final double tempMax;
  final String description;
  final String iconCode;

  final double precipitationChance;

  @override
  List<Object?> get props => [
    dateTime,
    temperature,
    tempMin,
    tempMax,
    description,
    iconCode,
    precipitationChance,
  ];
}
