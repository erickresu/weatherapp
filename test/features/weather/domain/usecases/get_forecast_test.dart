import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/core/error/failure.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/coordinates_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/forecast_entry_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/weather_query.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/repositories/weather_repository.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/usecases/get_forecast.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

const _query = CoordinatesWeatherQuery(
  CoordinatesEntity(latitude: 14.6, longitude: 120.98),
);

void main() {
  late MockWeatherRepository repository;
  late GetForecast getForecast;

  setUp(() {
    repository = MockWeatherRepository();
    getForecast = GetForecast(repository);
  });

  test('returns the repository result for the query', () async {
    final entries = [
      ForecastEntryEntity(
        dateTime: DateTime.utc(2026, 11, 27, 15),
        temperature: 28,
        tempMin: 27,
        tempMax: 28,
        description: 'light rain',
        iconCode: '10d',
        precipitationChance: 0.3,
      ),
    ];
    when(() => repository.getForecast(_query))
        .thenAnswer((_) async => Right(entries));

    final result = await getForecast(_query);

    result.fold((f) => fail('expected Right'), (r) => expect(r, entries));
    verify(() => repository.getForecast(_query)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('returns the repository failure unchanged', () async {
    final failure = NetworkFailure();
    when(() => repository.getForecast(_query))
        .thenAnswer((_) async => Left(failure));

    final result = await getForecast(_query);

    expect(result, Left<Failure, List<ForecastEntryEntity>>(failure));
  });
}
