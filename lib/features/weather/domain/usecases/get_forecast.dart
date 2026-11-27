import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/forecast_entry_entity.dart';
import '../entities/weather_query.dart';
import '../repositories/weather_repository.dart';

@lazySingleton
class GetForecast {
  const GetForecast(this._repository);

  final WeatherRepository _repository;

  Future<Either<Failure, List<ForecastEntryEntity>>> call(WeatherQuery query) =>
      _repository.getForecast(query);
}
