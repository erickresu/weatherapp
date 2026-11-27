part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

final class WeatherLocationRequested extends WeatherEvent {
  const WeatherLocationRequested();
}

final class WeatherCitySearched extends WeatherEvent {
  const WeatherCitySearched(this.city);

  final String city;

  @override
  List<Object?> get props => [city];
}

/// [completer] lets RefreshIndicator stop even if the new state equals the old.
final class WeatherRefreshed extends WeatherEvent {
  const WeatherRefreshed({this.completer});

  final Completer<void>? completer;
}
