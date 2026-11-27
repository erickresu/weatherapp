import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/coordinates_entity.dart';
import '../repositories/location_repository.dart';

@lazySingleton
class GetCurrentLocation {
  const GetCurrentLocation(this._repository);

  final LocationRepository _repository;

  Future<Either<Failure, CoordinatesEntity>> call() =>
      _repository.getCurrentLocation();
}
