import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/coordinates_entity.dart';

abstract interface class LocationRepository {
  Future<Either<Failure, CoordinatesEntity>> getCurrentLocation();
}
