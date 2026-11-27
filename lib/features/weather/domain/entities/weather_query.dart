import 'package:equatable/equatable.dart';

import 'coordinates_entity.dart';

sealed class WeatherQuery extends Equatable {
  const WeatherQuery();
}

final class CityWeatherQuery extends WeatherQuery {
  const CityWeatherQuery(this.city);

  final String city;

  @override
  List<Object?> get props => [city];
}

final class CoordinatesWeatherQuery extends WeatherQuery {
  const CoordinatesWeatherQuery(this.coordinates);

  final CoordinatesEntity coordinates;

  @override
  List<Object?> get props => [coordinates];
}
