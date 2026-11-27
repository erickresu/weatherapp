import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/core/error/failure.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/coordinates_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/repositories/location_repository.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/usecases/get_current_location.dart';

class MockLocationRepository extends Mock implements LocationRepository {}

const _coordinates = CoordinatesEntity(latitude: 14.6, longitude: 120.98);

void main() {
  late MockLocationRepository repository;
  late GetCurrentLocation getCurrentLocation;

  setUp(() {
    repository = MockLocationRepository();
    getCurrentLocation = GetCurrentLocation(repository);
  });

  test('returns the repository coordinates', () async {
    when(() => repository.getCurrentLocation())
        .thenAnswer((_) async => const Right(_coordinates));

    final result = await getCurrentLocation();

    expect(result, const Right<Failure, CoordinatesEntity>(_coordinates));
    verify(() => repository.getCurrentLocation()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('returns the repository failure unchanged', () async {
    final failure = LocationFailure('Location permission denied.');
    when(() => repository.getCurrentLocation())
        .thenAnswer((_) async => Left(failure));

    final result = await getCurrentLocation();

    expect(result, Left<Failure, CoordinatesEntity>(failure));
  });
}
