part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherSuccess extends WeatherState {
  const WeatherSuccess({
    required this.current,
    required this.hourly,
    required this.daily,
  });

  final CurrentWeatherEntity current;

  final List<ForecastEntryEntity> hourly;
  final List<DailyForecastEntity> daily;

  @override
  List<Object?> get props => [current, hourly, daily];
}

final class WeatherError extends WeatherState {
  const WeatherError(this.message, {this.canRetry = true});

  final String message;

  final bool canRetry;

  @override
  List<Object?> get props => [message, canRetry];
}
