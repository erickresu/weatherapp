import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/daily_forecast_entity.dart';
import '../../domain/entities/forecast_entry_entity.dart';
import '../../domain/entities/weather_query.dart';
import '../../domain/usecases/get_current_location.dart';
import '../../domain/usecases/get_current_weather.dart';
import '../../domain/usecases/get_forecast.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._getCurrentWeather, this._getForecast, this._getLocation)
    : super(const WeatherInitial()) {
    on<WeatherLocationRequested>(_onLocationRequested);
    on<WeatherCitySearched>(_onCitySearched);
    on<WeatherRefreshed>(_onRefreshed);
  }

  static const hourlyCount = 8;

  static const dailyCount = 5;

  final GetCurrentWeather _getCurrentWeather;
  final GetForecast _getForecast;
  final GetCurrentLocation _getLocation;

  WeatherQuery? _lastQuery;

  // Newer request started → older loads must not emit (prevents stale results).
  int _requestId = 0;

  Future<void> _onLocationRequested(
    WeatherLocationRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final id = ++_requestId;
    _lastQuery = null;
    emit(const WeatherLoading());
    await _loadLocation(id, emit);
  }

  Future<void> _onCitySearched(
    WeatherCitySearched event,
    Emitter<WeatherState> emit,
  ) async {
    final city = event.city.trim();
    if (city.isEmpty) return;
    final id = ++_requestId;
    final query = CityWeatherQuery(city);
    _lastQuery = query;
    emit(const WeatherLoading());
    await _load(id, query, emit);
  }

  Future<void> _onRefreshed(
    WeatherRefreshed event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      final id = ++_requestId;
      if (state is! WeatherSuccess) emit(const WeatherLoading());
      final query = _lastQuery;
      if (query == null) {
        await _loadLocation(id, emit);
      } else {
        await _load(id, query, emit);
      }
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadLocation(int id, Emitter<WeatherState> emit) async {
    final location = await _getLocation();
    if (id != _requestId) return;
    await location.fold((failure) async => emit(_error(failure)), (
      coordinates,
    ) {
      final query = CoordinatesWeatherQuery(coordinates);
      _lastQuery = query;
      return _load(id, query, emit);
    });
  }

  Future<void> _load(
    int id,
    WeatherQuery query,
    Emitter<WeatherState> emit,
  ) async {
    final (current, forecast) = await (
      _getCurrentWeather(query),
      _getForecast(query),
    ).wait;
    if (id != _requestId) return;

    final result = current.flatMap(
      (weather) => forecast.map(
        (entries) => WeatherSuccess(
          current: weather,
          hourly: entries.take(hourlyCount).toList(),
          daily: DailyForecastEntity.fromEntries(entries)
              .take(dailyCount)
              .toList(),
        ),
      ),
    );
    emit(result.fold(_error, (success) => success));
  }

  WeatherError _error(Failure failure) =>
      WeatherError(failure.message, canRetry: failure is! NotFoundFailure);
}
