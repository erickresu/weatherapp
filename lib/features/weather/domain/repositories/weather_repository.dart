import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/current_weather_entity.dart';
import '../entities/forecast_entry_entity.dart';
import '../entities/weather_query.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather(
    WeatherQuery query,
  );

  Future<Either<Failure, List<ForecastEntryEntity>>> getForecast(
    WeatherQuery query,
  );
}
