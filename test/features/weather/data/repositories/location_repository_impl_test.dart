import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/core/error/exceptions.dart';
import 'package:try_ko_ulit_clean_arch/core/error/failure.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/datasources/location_data_source.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/repositories/location_repository_impl.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/coordinates_entity.dart';

class MockLocationDataSource extends Mock implements LocationDataSource {}

const _coordinates = CoordinatesEntity(latitude: 14.6, longitude: 120.98);

void main() {
  late MockLocationDataSource dataSource;
  late LocationRepositoryImpl repository;

  setUp(() {
    dataSource = MockLocationDataSource();
    repository = LocationRepositoryImpl(dataSource);
  });

  Future<Failure> failureFor(Object error) async {
    when(() => dataSource.getCurrentLocation()).thenThrow(error);
    final result = await repository.getCurrentLocation();
    expect(result.isLeft(), isTrue);
    return result.fold((f) => f, (_) => fail('expected Left, got $result'));
  }

  test('returns the coordinates when the data source succeeds', () async {
    when(() => dataSource.getCurrentLocation())
        .thenAnswer((_) async => _coordinates);

    final result = await repository.getCurrentLocation();

    expect(result, const Right<Failure, CoordinatesEntity>(_coordinates));
  });

  test('maps LocationException to LocationFailure with its message', () async {
    final failure = await failureFor(
      const LocationException('Location services are off.'),
    );

    expect(failure, isA<LocationFailure>());
    expect(failure.message, 'Location services are off.');
  });

  test('maps TimeoutException to LocationFailure about a timeout', () async {
    final failure = await failureFor(TimeoutException('too slow'));

    expect(failure, isA<LocationFailure>());
    expect(
      failure.message,
      'Could not get your location in time. Search for a city.',
    );
  });

  test('maps any other exception to the default LocationFailure', () async {
    final failure = await failureFor(StateError('platform channel died'));

    expect(failure, isA<LocationFailure>());
    expect(failure.message, 'Could not get your location.');
  });
}
