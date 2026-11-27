import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/core/error/exceptions.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/datasources/location_data_source.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/coordinates_entity.dart';

// The data source receives GeolocatorPlatform through its constructor and
// never touches GeolocatorPlatform.instance, so PlatformInterface's token check
// never runs and MockPlatformInterfaceMixin (a transitive-only dependency) is
// not needed.
class MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}

final _position = Position(
  latitude: 14.6042,
  longitude: 120.9822,
  timestamp: DateTime.utc(2026, 11, 27, 6),
  accuracy: 500,
  altitude: 0,
  altitudeAccuracy: 0,
  heading: 0,
  headingAccuracy: 0,
  speed: 0,
  speedAccuracy: 0,
);

Matcher _locationException(String message) =>
    isA<LocationException>().having((e) => e.message, 'message', message);

void main() {
  late MockGeolocatorPlatform geolocator;
  late LocationDataSourceImpl dataSource;

  setUpAll(() => registerFallbackValue(const LocationSettings()));

  setUp(() {
    geolocator = MockGeolocatorPlatform();
    dataSource = LocationDataSourceImpl(geolocator);
    when(() => geolocator.isLocationServiceEnabled())
        .thenAnswer((_) async => true);
    when(
      () => geolocator.getCurrentPosition(
        locationSettings: any(named: 'locationSettings'),
      ),
    ).thenAnswer((_) async => _position);
  });

  test('throws LocationException when location services are off', () async {
    when(() => geolocator.isLocationServiceEnabled())
        .thenAnswer((_) async => false);

    await expectLater(
      dataSource.getCurrentLocation(),
      throwsA(
        _locationException(
          'Location services are off. Turn them on or search for a city.',
        ),
      ),
    );
    verifyNever(() => geolocator.checkPermission());
  });

  test(
    'throws LocationException when permission is denied after request',
    () async {
      when(() => geolocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.denied);
      when(() => geolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.denied);

      await expectLater(
        dataSource.getCurrentLocation(),
        throwsA(
          _locationException(
            'Location permission denied. Search for a city instead.',
          ),
        ),
      );
      verify(() => geolocator.requestPermission()).called(1);
      verifyNever(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      );
    },
  );

  test('throws LocationException when permission is denied forever', () async {
    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.deniedForever);

    await expectLater(
      dataSource.getCurrentLocation(),
      throwsA(
        _locationException(
          'Location permission is blocked. '
          'Enable it in Settings or search for a city.',
        ),
      ),
    );
    verifyNever(() => geolocator.requestPermission());
  });

  test(
    'throws LocationException when request turns into deniedForever',
    () async {
      when(() => geolocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.denied);
      when(() => geolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.deniedForever);

      await expectLater(
        dataSource.getCurrentLocation(),
        throwsA(isA<LocationException>()),
      );
    },
  );

  test('returns coordinates when permission is already granted', () async {
    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.whileInUse);

    final result = await dataSource.getCurrentLocation();

    expect(
      result,
      const CoordinatesEntity(latitude: 14.6042, longitude: 120.9822),
    );
    verifyNever(() => geolocator.requestPermission());
  });

  test('returns coordinates when the permission request is granted', () async {
    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.denied);
    when(() => geolocator.requestPermission())
        .thenAnswer((_) async => LocationPermission.always);

    final result = await dataSource.getCurrentLocation();

    expect(
      result,
      const CoordinatesEntity(latitude: 14.6042, longitude: 120.9822),
    );
  });

  test('requests a low-accuracy position with a 15 second limit', () async {
    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.whileInUse);

    await dataSource.getCurrentLocation();

    final settings =
        verify(
              () => geolocator.getCurrentPosition(
                locationSettings: captureAny(named: 'locationSettings'),
              ),
            ).captured.single
            as LocationSettings;
    expect(settings.accuracy, LocationAccuracy.low);
    expect(settings.timeLimit, const Duration(seconds: 15));
  });

  test('lets a TimeoutException from the platform propagate', () async {
    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.whileInUse);
    when(
      () => geolocator.getCurrentPosition(
        locationSettings: any(named: 'locationSettings'),
      ),
    ).thenThrow(TimeoutException('no fix'));

    await expectLater(
      dataSource.getCurrentLocation(),
      throwsA(isA<TimeoutException>()),
    );
  });
}
