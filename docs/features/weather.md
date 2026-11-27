# Feature: Weather

Status: done (Android build and live API not yet verified)
Created: 2026-11-27

## Goal

The user sees the current weather and a 5-day forecast for where they are (GPS) or for any city they search.

## Screens

- `WeatherPage` (`lib/features/weather/presentation/pages/weather_page.dart`), the app's start route (`RouteNames.weather`).
  - App bar with a "my location" button that reloads weather for the GPS position.
  - City search field; submitting loads that city.
  - Current weather card: city and country, temperature, description, icon, feels like, min/max, humidity, wind, pressure.
  - Next 24 hours: horizontal strip of the next 8 three-hour steps.
  - 5-day list: one row per day with icon, min and max (capped at 5 rows; the 40 steps can touch 6 calendar days, and today is partial).
  - Pull to refresh reloads the last query (the last city, or the last GPS coordinates without asking GPS again).
  - Error view with the failure message and a Retry button (hidden for "City not found").

## API

OpenWeather 2.5, base URL `https://api.openweathermap.org/data/2.5`, `units=metric`, key sent as `appid`.

| Method | Endpoint | Request | Response |
| --- | --- | --- | --- |
| GET | `/weather` | `q=<city>` or `lat=&lon=` | `name`, `sys.country`, `dt`, `timezone`, `main.{temp, feels_like, temp_min, temp_max, humidity, pressure}`, `wind.speed`, `weather[0].{main, description, icon}` |
| GET | `/forecast` | `q=<city>` or `lat=&lon=` | `city.timezone`, `list[]` of 40 three-hour steps: `dt`, `main.{temp, temp_min, temp_max}`, `weather[0].{description, icon}`, `pop` |

The API key comes from `--dart-define-from-file=env/dev.json` (`OPENWEATHER_API_KEY`), never from source. See [0002-openweather-api-key](../decisions/0002-openweather-api-key.md).

## Domain

- Entities: `CurrentWeatherEntity`, `ForecastEntryEntity`, `DailyForecastEntity` (groups entries by local day), `CoordinatesEntity`, `WeatherQuery` (sealed: `CityWeatherQuery`, `CoordinatesWeatherQuery`).
- Use cases: `GetCurrentWeather(query)`, `GetForecast(query)`, `GetCurrentLocation()`.
- Repository interfaces: `WeatherRepository` (current, forecast), `LocationRepository` (device position via `geolocator`).

Times are the city's local wall-clock time (`dt + timezone`), so forecast days group by the city's calendar, not the phone's. The API gives one offset per city, so steps after a DST change in the 5-day window are off by an hour (accepted).

## States

- `WeatherInitial`
- `WeatherLoading`
- `WeatherSuccess`: current weather, next 8 forecast steps (`hourlyCount`), up to 5 daily summaries (`dailyCount`).
- `WeatherError(message, canRetry)`: `canRetry` is false only for `NotFoundFailure`.
  - `NotFoundFailure` (404): "City not found."
  - `UnauthorizedFailure` (401 or missing key): explains the key problem.
  - `NetworkFailure`: "No internet connection." / timeout.
  - `ServerFailure`: other HTTP errors.
  - `LocationFailure`: services off, permission denied, permanently denied, or timeout. The user can still search a city.

## Edge cases

- No network.
- Unknown city (404).
- Location services off or permission denied: show the message; search still works.
- Missing API key (app run without `--dart-define-from-file`): clear error instead of a 401.
- Empty or whitespace search: ignored.
- Pull to refresh while showing results keeps the results on screen until new data arrives. If the refresh fails, the error view replaces the results (known gap; could become a SnackBar).
- Overlapping requests (search during a slow GPS lookup, double taps): only the newest request may emit; older results are dropped.
- Retry after a location error retries location, not the previous city.

## Done when

- [ ] Works on Android and iOS
- [x] Bloc has tests for success and error (91 weather tests: models, repositories, location data source, use cases, bloc, page)
- [x] This note is updated with anything that changed while building
