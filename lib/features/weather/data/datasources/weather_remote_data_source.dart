import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/network/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/weather_query.dart';
import '../models/current_weather_model.dart';
import '../models/forecast_model.dart';

abstract interface class WeatherRemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeather(WeatherQuery query);

  Future<ForecastResponseModel> getForecast(WeatherQuery query);
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<CurrentWeatherModel> getCurrentWeather(WeatherQuery query) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${ApiConstants.openWeatherBaseUrl}/weather',
      queryParameters: _params(query),
    );
    return CurrentWeatherModel.fromJson(response.data!);
  }

  @override
  Future<ForecastResponseModel> getForecast(WeatherQuery query) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${ApiConstants.openWeatherBaseUrl}/forecast',
      queryParameters: _params(query),
    );
    return ForecastResponseModel.fromJson(response.data!);
  }

  Map<String, dynamic> _params(WeatherQuery query) {
    const apiKey = ApiConstants.openWeatherApiKey;
    if (apiKey.isEmpty) {
      throw const MissingApiKeyException('OPENWEATHER_API_KEY');
    }
    return {
      ...switch (query) {
        CityWeatherQuery(:final city) => {'q': city},
        CoordinatesWeatherQuery(:final coordinates) => {
          'lat': coordinates.latitude,
          'lon': coordinates.longitude,
        },
      },
      'units': 'metric',
      'appid': apiKey,
    };
  }
}
