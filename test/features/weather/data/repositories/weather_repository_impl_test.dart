import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/core/error/exceptions.dart';
import 'package:try_ko_ulit_clean_arch/core/error/failure.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/models/current_weather_model.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/models/forecast_model.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/models/weather_parts_model.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/coordinates_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/current_weather_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/forecast_entry_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/weather_query.dart';

class MockWeatherRemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}

const _cityQuery = CityWeatherQuery('Manila');
const _coordsQuery = CoordinatesWeatherQuery(
  CoordinatesEntity(latitude: 14.6, longitude: 120.98),
);

final _dt = DateTime.utc(2026, 11, 27, 6).millisecondsSinceEpoch ~/ 1000;

const _main = WeatherMainModel(
  temp: 30,
  feelsLike: 35,
  tempMin: 29,
  tempMax: 31,
  humidity: 70,
  pressure: 1008,
);

final _currentModel = CurrentWeatherModel(
  name: 'Manila',
  dt: _dt,
  timezone: 28800,
  main: _main,
  wind: const WindModel(speed: 4.1),
  weather: const [
    WeatherConditionModel(
      main: 'Clouds',
      description: 'broken clouds',
      icon: '04d',
    ),
  ],
  sys: const CurrentWeatherSysModel(country: 'PH'),
);

final _currentEntity = CurrentWeatherEntity(
  cityName: 'Manila',
  country: 'PH',
  dateTime: DateTime.utc(2026, 11, 27, 14),
  temperature: 30,
  feelsLike: 35,
  tempMin: 29,
  tempMax: 31,
  humidity: 70,
  pressure: 1008,
  windSpeed: 4.1,
  condition: 'Clouds',
  description: 'broken clouds',
  iconCode: '04d',
);

final _forecastModel = ForecastResponseModel(
  city: const ForecastCityModel(name: 'Manila', timezone: 28800),
  list: [
    ForecastItemModel(
      dt: _dt,
      main: _main,
      weather: const [
        WeatherConditionModel(description: 'light rain', icon: '10d'),
      ],
      pop: 0.4,
    ),
  ],
);

final _forecastEntries = [
  ForecastEntryEntity(
    dateTime: DateTime.utc(2026, 11, 27, 14),
    temperature: 30,
    tempMin: 29,
    tempMax: 31,
    description: 'light rain',
    iconCode: '10d',
    precipitationChance: 0.4,
  ),
];

final _options = RequestOptions(path: '/weather');

DioException _status(int code) => DioException(
  requestOptions: _options,
  type: DioExceptionType.badResponse,
  response: Response<dynamic>(requestOptions: _options, statusCode: code),
);

DioException _type(DioExceptionType type) =>
    DioException(requestOptions: _options, type: type);

void main() {
  late MockWeatherRemoteDataSource remote;
  late WeatherRepositoryImpl repository;

  setUp(() {
    remote = MockWeatherRemoteDataSource();
    repository = WeatherRepositoryImpl(remote);
  });

  /// Makes the current-weather call throw [error] and returns the failure.
  Future<Failure> currentFailure(Object error) async {
    when(() => remote.getCurrentWeather(_cityQuery)).thenThrow(error);
    final result = await repository.getCurrentWeather(_cityQuery);
    expect(result.isLeft(), isTrue);
    return result.fold((f) => f, (_) => fail('expected Left, got $result'));
  }

  group('getCurrentWeather', () {
    test('returns the mapped entity when the data source succeeds', () async {
      when(() => remote.getCurrentWeather(_cityQuery))
          .thenAnswer((_) async => _currentModel);

      final result = await repository.getCurrentWeather(_cityQuery);

      expect(result, Right<Failure, CurrentWeatherEntity>(_currentEntity));
      verify(() => remote.getCurrentWeather(_cityQuery)).called(1);
    });

    test('passes a coordinates query through to the data source', () async {
      when(() => remote.getCurrentWeather(_coordsQuery))
          .thenAnswer((_) async => _currentModel);

      final result = await repository.getCurrentWeather(_coordsQuery);

      expect(result, Right<Failure, CurrentWeatherEntity>(_currentEntity));
      verify(() => remote.getCurrentWeather(_coordsQuery)).called(1);
    });

    test('maps 401 to UnauthorizedFailure', () async {
      final failure = await currentFailure(_status(401));

      expect(failure, isA<UnauthorizedFailure>());
      expect(failure.message, 'Invalid OpenWeather API key.');
    });

    test('maps 404 to NotFoundFailure with "City not found."', () async {
      final failure = await currentFailure(_status(404));

      expect(failure, isA<NotFoundFailure>());
      expect(failure.message, 'City not found.');
    });

    test('maps 429 to ServerFailure about too many requests', () async {
      final failure = await currentFailure(_status(429));

      expect(failure, isA<ServerFailure>());
      expect(failure.message, 'Too many requests. Try again in a minute.');
    });

    test('maps 500 to ServerFailure including the status code', () async {
      final failure = await currentFailure(_status(500));

      expect(failure, isA<ServerFailure>());
      expect(failure.message, 'Weather service error (500).');
    });

    test('maps connectionTimeout to NetworkFailure about a timeout', () async {
      final failure = await currentFailure(
        _type(DioExceptionType.connectionTimeout),
      );

      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'The weather service took too long to respond.');
    });

    test('maps receiveTimeout to NetworkFailure about a timeout', () async {
      final failure = await currentFailure(
        _type(DioExceptionType.receiveTimeout),
      );

      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'The weather service took too long to respond.');
    });

    test('maps sendTimeout to NetworkFailure about a timeout', () async {
      final failure = await currentFailure(_type(DioExceptionType.sendTimeout));

      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'The weather service took too long to respond.');
    });

    test('maps connectionError to NetworkFailure "No internet"', () async {
      final failure = await currentFailure(
        _type(DioExceptionType.connectionError),
      );

      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'No internet connection.');
    });

    test('maps MissingApiKeyException to UnauthorizedFailure', () async {
      final failure = await currentFailure(
        const MissingApiKeyException('OPENWEATHER_API_KEY'),
      );

      expect(failure, isA<UnauthorizedFailure>());
      expect(
        failure.message,
        'OpenWeather API key missing. '
        'Run with --dart-define-from-file=env/dev.json.',
      );
    });

    test('maps any other exception to ServerFailure', () async {
      final failure = await currentFailure(const FormatException('bad json'));

      expect(failure, isA<ServerFailure>());
      expect(failure.message, 'Unexpected error. Please try again.');
    });
  });

  group('getForecast', () {
    test('returns the mapped entries when the data source succeeds', () async {
      when(() => remote.getForecast(_cityQuery))
          .thenAnswer((_) async => _forecastModel);

      final result = await repository.getForecast(_cityQuery);

      expect(result.isRight(), isTrue);
      result.fold(
        (f) => fail('expected Right, got ${f.message}'),
        (entries) => expect(entries, _forecastEntries),
      );
      verify(() => remote.getForecast(_cityQuery)).called(1);
    });

    test('maps 404 to NotFoundFailure', () async {
      when(() => remote.getForecast(_cityQuery)).thenThrow(_status(404));

      final result = await repository.getForecast(_cityQuery);

      result.fold((failure) {
        expect(failure, isA<NotFoundFailure>());
        expect(failure.message, 'City not found.');
      }, (_) => fail('expected Left'));
    });

    test('maps connectionError to NetworkFailure', () async {
      when(() => remote.getForecast(_cityQuery))
          .thenThrow(_type(DioExceptionType.connectionError));

      final result = await repository.getForecast(_cityQuery);

      result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (_) => fail('expected Left'),
      );
    });

    test('maps MissingApiKeyException to UnauthorizedFailure', () async {
      when(() => remote.getForecast(_cityQuery))
          .thenThrow(const MissingApiKeyException('OPENWEATHER_API_KEY'));

      final result = await repository.getForecast(_cityQuery);

      result.fold(
        (failure) => expect(failure, isA<UnauthorizedFailure>()),
        (_) => fail('expected Left'),
      );
    });

    test('maps any other exception to ServerFailure', () async {
      when(() => remote.getForecast(_cityQuery)).thenThrow(StateError('boom'));

      final result = await repository.getForecast(_cityQuery);

      result.fold((failure) {
        expect(failure, isA<ServerFailure>());
        expect(failure.message, 'Unexpected error. Please try again.');
      }, (_) => fail('expected Left'));
    });
  });
}
