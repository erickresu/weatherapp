// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:geolocator/geolocator.dart' as _i699;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/weather/data/datasources/location_data_source.dart'
    as _i146;
import '../../features/weather/data/datasources/weather_remote_data_source.dart'
    as _i97;
import '../../features/weather/data/repositories/location_repository_impl.dart'
    as _i62;
import '../../features/weather/data/repositories/weather_repository_impl.dart'
    as _i231;
import '../../features/weather/domain/repositories/location_repository.dart'
    as _i262;
import '../../features/weather/domain/repositories/weather_repository.dart'
    as _i956;
import '../../features/weather/domain/usecases/get_current_location.dart'
    as _i353;
import '../../features/weather/domain/usecases/get_current_weather.dart'
    as _i271;
import '../../features/weather/domain/usecases/get_forecast.dart' as _i284;
import '../../features/weather/presentation/bloc/weather_bloc.dart' as _i433;
import 'core_module.dart' as _i154;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final coreModule = _$CoreModule();
  gh.lazySingleton<_i361.Dio>(() => coreModule.dio);
  gh.lazySingleton<_i558.FlutterSecureStorage>(() => coreModule.secureStorage);
  gh.lazySingleton<_i699.GeolocatorPlatform>(() => coreModule.geolocator);
  gh.lazySingleton<_i97.WeatherRemoteDataSource>(
    () => _i97.WeatherRemoteDataSourceImpl(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i146.LocationDataSource>(
    () => _i146.LocationDataSourceImpl(gh<_i699.GeolocatorPlatform>()),
  );
  gh.lazySingleton<_i956.WeatherRepository>(
    () => _i231.WeatherRepositoryImpl(gh<_i97.WeatherRemoteDataSource>()),
  );
  gh.lazySingleton<_i271.GetCurrentWeather>(
    () => _i271.GetCurrentWeather(gh<_i956.WeatherRepository>()),
  );
  gh.lazySingleton<_i284.GetForecast>(
    () => _i284.GetForecast(gh<_i956.WeatherRepository>()),
  );
  gh.lazySingleton<_i262.LocationRepository>(
    () => _i62.LocationRepositoryImpl(gh<_i146.LocationDataSource>()),
  );
  gh.lazySingleton<_i353.GetCurrentLocation>(
    () => _i353.GetCurrentLocation(gh<_i262.LocationRepository>()),
  );
  gh.factory<_i433.WeatherBloc>(
    () => _i433.WeatherBloc(
      gh<_i271.GetCurrentWeather>(),
      gh<_i284.GetForecast>(),
      gh<_i353.GetCurrentLocation>(),
    ),
  );
  return getIt;
}

class _$CoreModule extends _i154.CoreModule {}
