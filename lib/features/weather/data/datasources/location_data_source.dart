import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/coordinates_entity.dart';

abstract interface class LocationDataSource {
  Future<CoordinatesEntity> getCurrentLocation();
}

@LazySingleton(as: LocationDataSource)
class LocationDataSourceImpl implements LocationDataSource {
  LocationDataSourceImpl(this._geolocator);

  final GeolocatorPlatform _geolocator;

  @override
  Future<CoordinatesEntity> getCurrentLocation() async {
    if (!await _geolocator.isLocationServiceEnabled()) {
      throw const LocationException(
        'Location services are off. Turn them on or search for a city.',
      );
    }

    var permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      throw const LocationException(
        'Location permission denied. Search for a city instead.',
      );
    }
    if (permission == LocationPermission.deniedForever) {
      throw const LocationException(
        'Location permission is blocked. Enable it in Settings or search for a city.',
      );
    }

    final position = await _geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 15),
      ),
    );
    return CoordinatesEntity(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
