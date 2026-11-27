import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/core/error/failure.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/coordinates_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/current_weather_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/daily_forecast_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/forecast_entry_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/weather_query.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/usecases/get_current_location.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/usecases/get_current_weather.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/usecases/get_forecast.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/presentation/bloc/weather_bloc.dart';

class MockGetCurrentWeather extends Mock implements GetCurrentWeather {}

class MockGetForecast extends Mock implements GetForecast {}

class MockGetCurrentLocation extends Mock implements GetCurrentLocation {}

const _coordinates = CoordinatesEntity(latitude: 14.6, longitude: 120.98);
const _coordsQuery = CoordinatesWeatherQuery(_coordinates);
const _manilaQuery = CityWeatherQuery('Manila');

CurrentWeatherEntity _current({String city = 'Manila', double temp = 30}) =>
    CurrentWeatherEntity(
      cityName: city,
      country: 'PH',
      dateTime: DateTime.utc(2026, 11, 27, 14),
      temperature: temp,
      feelsLike: 35,
      tempMin: 29,
      tempMax: 31,
      humidity: 70,
      pressure: 1008,
      windSpeed: 4,
      condition: 'Clouds',
      description: 'broken clouds',
      iconCode: '04d',
    );

/// 48 three-hour steps: six full city-local days starting 2026-11-27.
final _entries = [
  for (var i = 0; i < 48; i++)
    ForecastEntryEntity(
      dateTime: DateTime.utc(2026, 11, 27).add(Duration(hours: 3 * i)),
      temperature: 20.0 + i % 8,
      tempMin: 19.0 + i % 8,
      tempMax: 21.0 + i % 8,
      description: 'step $i',
      iconCode: '01d',
      precipitationChance: 0,
    ),
];

WeatherSuccess _success(CurrentWeatherEntity current) => WeatherSuccess(
  current: current,
  hourly: _entries.take(8).toList(),
  daily: DailyForecastEntity.fromEntries(_entries).take(5).toList(),
);

void main() {
  late MockGetCurrentWeather getCurrentWeather;
  late MockGetForecast getForecast;
  late MockGetCurrentLocation getLocation;

  setUpAll(() => registerFallbackValue(_manilaQuery));

  setUp(() {
    getCurrentWeather = MockGetCurrentWeather();
    getForecast = MockGetForecast();
    getLocation = MockGetCurrentLocation();
    when(() => getLocation())
        .thenAnswer((_) async => const Right(_coordinates));
    when(() => getCurrentWeather(any()))
        .thenAnswer((_) async => Right(_current()));
    when(() => getForecast(any())).thenAnswer((_) async => Right(_entries));
  });

  WeatherBloc build() =>
      WeatherBloc(getCurrentWeather, getForecast, getLocation);

  /// Adds [event] and waits for [states], in order.
  Future<void> expectStates(
    WeatherBloc bloc,
    WeatherEvent event,
    List<WeatherState> states,
  ) async {
    final expectation = expectLater(bloc.stream, emitsInOrder(states));
    bloc.add(event);
    await expectation;
  }

  test('starts in WeatherInitial', () async {
    final bloc = build();

    expect(bloc.state, const WeatherInitial());
    await bloc.close();
  });

  group('WeatherLocationRequested', () {
    test('emits [Loading, Success] with 8 hourly steps and 5 days', () async {
      final bloc = build();

      await expectStates(bloc, const WeatherLocationRequested(), [
        const WeatherLoading(),
        _success(_current()),
      ]);

      final success = bloc.state as WeatherSuccess;
      expect(success.hourly, _entries.take(WeatherBloc.hourlyCount));
      expect(success.daily, hasLength(WeatherBloc.dailyCount));
      expect(success.daily.first.date, DateTime.utc(2026, 11, 27));
      expect(success.daily.last.date, DateTime.utc(2026, 12, 1));
      verify(() => getCurrentWeather(_coordsQuery)).called(1);
      verify(() => getForecast(_coordsQuery)).called(1);
      await bloc.close();
    });

    test('emits [Loading, Error] when the location fails', () async {
      when(() => getLocation())
          .thenAnswer((_) async => Left(LocationFailure('Location is off.')));
      final bloc = build();

      await expectStates(bloc, const WeatherLocationRequested(), [
        const WeatherLoading(),
        const WeatherError('Location is off.'),
      ]);

      verifyNever(() => getCurrentWeather(any()));
      verifyNever(() => getForecast(any()));
      await bloc.close();
    });

    test('emits [Loading, Error] when current weather fails', () async {
      when(() => getCurrentWeather(_coordsQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server down.')));
      final bloc = build();

      await expectStates(bloc, const WeatherLocationRequested(), [
        const WeatherLoading(),
        const WeatherError('Server down.'),
      ]);
      await bloc.close();
    });

    test('emits [Loading, Error] when the forecast fails', () async {
      when(() => getForecast(_coordsQuery))
          .thenAnswer((_) async => Left(NetworkFailure()));
      final bloc = build();

      await expectStates(bloc, const WeatherLocationRequested(), [
        const WeatherLoading(),
        const WeatherError('No internet connection.'),
      ]);
      await bloc.close();
    });

    test('reports the current-weather failure when both calls fail', () async {
      when(() => getCurrentWeather(any()))
          .thenAnswer((_) async => Left(UnauthorizedFailure('Bad key.')));
      when(() => getForecast(any()))
          .thenAnswer((_) async => Left(NetworkFailure()));
      final bloc = build();

      await expectStates(bloc, const WeatherLocationRequested(), [
        const WeatherLoading(),
        const WeatherError('Bad key.'),
      ]);
      await bloc.close();
    });
  });

  group('WeatherCitySearched', () {
    test('trims the input and queries CityWeatherQuery("Manila")', () async {
      final bloc = build();

      await expectStates(bloc, const WeatherCitySearched('  Manila  '), [
        const WeatherLoading(),
        _success(_current()),
      ]);

      verify(() => getCurrentWeather(_manilaQuery)).called(1);
      verify(() => getForecast(_manilaQuery)).called(1);
      verifyNever(() => getLocation());
      await bloc.close();
    });

    test('emits nothing for blank input', () async {
      final bloc = build();
      final expectation = expectLater(bloc.stream, emitsDone);

      bloc.add(const WeatherCitySearched('   '));
      await bloc.close();

      await expectation;
      verifyNever(() => getCurrentWeather(any()));
      verifyNever(() => getForecast(any()));
    });

    test('emits a non-retryable Error for NotFoundFailure', () async {
      when(() => getCurrentWeather(const CityWeatherQuery('Atlantis')))
          .thenAnswer((_) async => Left(NotFoundFailure('City not found.')));
      final bloc = build();

      await expectStates(bloc, const WeatherCitySearched('Atlantis'), [
        const WeatherLoading(),
        const WeatherError('City not found.', canRetry: false),
      ]);
      await bloc.close();
    });

    test('emits a retryable Error for other failures', () async {
      when(() => getForecast(_manilaQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server down.')));
      final bloc = build();

      await expectStates(bloc, const WeatherCitySearched('Manila'), [
        const WeatherLoading(),
        const WeatherError('Server down.', canRetry: true),
      ]);
      await bloc.close();
    });
  });

  group('stale requests', () {
    test(
      'a slow location result never overrides a later city search',
      () async {
        final location = Completer<Either<Failure, CoordinatesEntity>>();
        when(() => getLocation()).thenAnswer((_) => location.future);
        when(() => getCurrentWeather(_coordsQuery))
            .thenAnswer((_) async => Right(_current(city: 'Quezon City')));
        final bloc = build();
        final states = <WeatherState>[];
        final sub = bloc.stream.listen(states.add);

        await expectStates(bloc, const WeatherLocationRequested(), [
          const WeatherLoading(),
        ]);
        await expectStates(bloc, const WeatherCitySearched('Manila'), [
          _success(_current()),
        ]);

        location.complete(const Right(_coordinates));
        await pumpEventQueue();

        expect(states, [const WeatherLoading(), _success(_current())]);
        expect(bloc.state, _success(_current()));
        verifyNever(() => getCurrentWeather(_coordsQuery));
        await sub.cancel();
        await bloc.close();
      },
    );

    test(
      'a slow location failure never overrides a later city search',
      () async {
        final location = Completer<Either<Failure, CoordinatesEntity>>();
        when(() => getLocation()).thenAnswer((_) => location.future);
        final bloc = build();

        await expectStates(bloc, const WeatherLocationRequested(), [
          const WeatherLoading(),
        ]);
        await expectStates(bloc, const WeatherCitySearched('Manila'), [
          _success(_current()),
        ]);

        location.complete(Left(LocationFailure('Timed out.')));
        await pumpEventQueue();

        expect(bloc.state, _success(_current()));
        await bloc.close();
      },
    );

    test('a slow city response never overrides a later city search', () async {
      final slow = Completer<Either<Failure, CurrentWeatherEntity>>();
      when(() => getCurrentWeather(const CityWeatherQuery('Cebu')))
          .thenAnswer((_) => slow.future);
      final bloc = build();

      await expectStates(bloc, const WeatherCitySearched('Cebu'), [
        const WeatherLoading(),
      ]);
      await expectStates(bloc, const WeatherCitySearched('Manila'), [
        _success(_current()),
      ]);

      slow.complete(Right(_current(city: 'Cebu')));
      await pumpEventQueue();

      expect(bloc.state, _success(_current()));
      await bloc.close();
    });
  });

  group('WeatherRefreshed', () {
    test('with no previous query emits Loading and runs location', () async {
      final bloc = build();

      await expectStates(bloc, const WeatherRefreshed(), [
        const WeatherLoading(),
        _success(_current()),
      ]);

      verify(() => getLocation()).called(1);
      verify(() => getCurrentWeather(_coordsQuery)).called(1);
      await bloc.close();
    });

    test('after a success re-queries the last city without Loading', () async {
      final bloc = build();
      await expectStates(bloc, const WeatherCitySearched('Manila'), [
        const WeatherLoading(),
        _success(_current()),
      ]);
      when(() => getCurrentWeather(_manilaQuery))
          .thenAnswer((_) async => Right(_current(temp: 31)));

      await expectStates(bloc, const WeatherRefreshed(), [
        _success(_current(temp: 31)),
      ]);

      verify(() => getCurrentWeather(_manilaQuery)).called(2);
      verifyNever(() => getLocation());
      await bloc.close();
    });

    test(
      'after a GPS success re-queries the same coordinates, not GPS',
      () async {
        final bloc = build();
        await expectStates(bloc, const WeatherLocationRequested(), [
          const WeatherLoading(),
          _success(_current()),
        ]);
        when(() => getCurrentWeather(_coordsQuery))
            .thenAnswer((_) async => Right(_current(temp: 31)));

        await expectStates(bloc, const WeatherRefreshed(), [
          _success(_current(temp: 31)),
        ]);

        verify(() => getLocation()).called(1);
        verify(() => getCurrentWeather(_coordsQuery)).called(2);
        await bloc.close();
      },
    );

    test('completes its completer when the new state equals the old', () async {
      final bloc = build();
      await expectStates(bloc, const WeatherCitySearched('Manila'), [
        const WeatherLoading(),
        _success(_current()),
      ]);
      final states = <WeatherState>[];
      final sub = bloc.stream.listen(states.add);
      final done = Completer<void>();

      bloc.add(WeatherRefreshed(completer: done));
      await done.future.timeout(const Duration(seconds: 1));

      expect(done.isCompleted, isTrue);
      expect(states, isEmpty);
      expect(bloc.state, _success(_current()));
      verify(() => getCurrentWeather(_manilaQuery)).called(2);
      await sub.cancel();
      await bloc.close();
    });

    test('completes its completer when the reload fails', () async {
      final bloc = build();
      await expectStates(bloc, const WeatherCitySearched('Manila'), [
        const WeatherLoading(),
        _success(_current()),
      ]);
      when(() => getCurrentWeather(_manilaQuery))
          .thenAnswer((_) async => Left(NetworkFailure()));
      final done = Completer<void>();

      await expectStates(bloc, WeatherRefreshed(completer: done), [
        const WeatherError('No internet connection.'),
      ]);

      await done.future.timeout(const Duration(seconds: 1));
      await bloc.close();
    });

    test('after an error emits Loading and re-queries the city', () async {
      when(() => getCurrentWeather(_manilaQuery))
          .thenAnswer((_) async => Left(NetworkFailure()));
      final bloc = build();
      await expectStates(bloc, const WeatherCitySearched('Manila'), [
        const WeatherLoading(),
        const WeatherError('No internet connection.'),
      ]);
      when(() => getCurrentWeather(_manilaQuery))
          .thenAnswer((_) async => Right(_current()));

      await expectStates(bloc, const WeatherRefreshed(), [
        const WeatherLoading(),
        _success(_current()),
      ]);

      verify(() => getCurrentWeather(_manilaQuery)).called(2);
      verifyNever(() => getLocation());
      await bloc.close();
    });

    test(
      'after a location failure retries location, not an older city',
      () async {
        final bloc = build();
        await expectStates(bloc, const WeatherCitySearched('Manila'), [
          const WeatherLoading(),
          _success(_current()),
        ]);
        when(
          () => getLocation(),
        ).thenAnswer((_) async => Left(LocationFailure('Permission denied.')));
        await expectStates(bloc, const WeatherLocationRequested(), [
          const WeatherLoading(),
          const WeatherError('Permission denied.'),
        ]);
        when(() => getLocation())
            .thenAnswer((_) async => const Right(_coordinates));

        await expectStates(bloc, const WeatherRefreshed(), [
          const WeatherLoading(),
          _success(_current()),
        ]);

        verify(() => getLocation()).called(2);
        verify(() => getCurrentWeather(_manilaQuery)).called(1);
        verify(() => getCurrentWeather(_coordsQuery)).called(1);
        await bloc.close();
      },
    );
  });
}
