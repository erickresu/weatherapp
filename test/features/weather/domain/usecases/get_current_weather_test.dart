import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/core/error/failure.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/current_weather_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/weather_query.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/repositories/weather_repository.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/usecases/get_current_weather.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

const _query = CityWeatherQuery('Manila');

final _entity = CurrentWeatherEntity(
  cityName: 'Manila',
  country: 'PH',
  dateTime: DateTime.utc(2026, 11, 27, 14),
  temperature: 30,
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

void main() {
  late MockWeatherRepository repository;
  late GetCurrentWeather getCurrentWeather;

  setUp(() {
    repository = MockWeatherRepository();
    getCurrentWeather = GetCurrentWeather(repository);
  });

  test('returns the repository result for the query', () async {
    final expected = Right<Failure, CurrentWeatherEntity>(_entity);
    when(() => repository.getCurrentWeather(_query))
        .thenAnswer((_) async => expected);

    final result = await getCurrentWeather(_query);

    expect(result, expected);
    verify(() => repository.getCurrentWeather(_query)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('returns the repository failure unchanged', () async {
    final failure = NotFoundFailure('City not found.');
    when(() => repository.getCurrentWeather(_query))
        .thenAnswer((_) async => Left(failure));

    final result = await getCurrentWeather(_query);

    expect(result, Left<Failure, CurrentWeatherEntity>(failure));
  });
}
