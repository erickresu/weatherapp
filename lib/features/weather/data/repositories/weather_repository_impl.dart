import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/forecast_entry_entity.dart';
import '../../domain/entities/weather_query.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_data_source.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl(this._remote);

  final WeatherRemoteDataSource _remote;

  @override
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather(
    WeatherQuery query,
  ) => _guard(() async => (await _remote.getCurrentWeather(query)).toEntity());

  @override
  Future<Either<Failure, List<ForecastEntryEntity>>> getForecast(
    WeatherQuery query,
  ) => _guard(() async => (await _remote.getForecast(query)).toEntities());

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() run) async {
    try {
      return Right(await run());
    } on MissingApiKeyException {
      return Left(
        UnauthorizedFailure(
          'OpenWeather API key missing. Run with --dart-define-from-file=env/dev.json.',
        ),
      );
    } on DioException catch (e) {
      return Left(_mapDioException(e));
    } catch (e, s) {
      LoggerUtils.logError('Weather request failed', e, s);
      return Left(ServerFailure('Unexpected error. Please try again.'));
    }
  }

  Failure _mapDioException(DioException e) {
    final status = e.response?.statusCode;
    if (status == 401) {
      return UnauthorizedFailure('Invalid OpenWeather API key.');
    }
    if (status == 404) return NotFoundFailure('City not found.');
    if (status == 429) {
      return ServerFailure('Too many requests. Try again in a minute.');
    }
    if (status != null) {
      return ServerFailure('Weather service error ($status).');
    }

    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => NetworkFailure(
        'The weather service took too long to respond.',
      ),
      _ => NetworkFailure(),
    };
  }
}
