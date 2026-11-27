import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/current_weather_entity.dart';
import '../entities/weather_query.dart';
import '../repositories/weather_repository.dart';

@lazySingleton
class GetCurrentWeather {
  const GetCurrentWeather(this._repository);

  final WeatherRepository _repository;

  Future<Either<Failure, CurrentWeatherEntity>> call(WeatherQuery query) =>
      _repository.getCurrentWeather(query);
}
