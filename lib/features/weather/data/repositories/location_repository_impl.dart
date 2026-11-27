import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/coordinates_entity.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/location_data_source.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  const LocationRepositoryImpl(this._dataSource);

  final LocationDataSource _dataSource;

  @override
  Future<Either<Failure, CoordinatesEntity>> getCurrentLocation() async {
    try {
      return Right(await _dataSource.getCurrentLocation());
    } on LocationException catch (e) {
      return Left(LocationFailure(e.message));
    } on TimeoutException {
      return Left(
        LocationFailure(
          'Could not get your location in time. Search for a city.',
        ),
      );
    } catch (e, s) {
      LoggerUtils.logError('Location lookup failed', e, s);
      return Left(LocationFailure());
    }
  }
}
