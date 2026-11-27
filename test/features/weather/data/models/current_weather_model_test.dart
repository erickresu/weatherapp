import 'package:flutter_test/flutter_test.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/models/current_weather_model.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/current_weather_entity.dart';

/// 2026-11-27 06:00 UTC, which is 14:00 in Manila (UTC+8).
final _dt = DateTime.utc(2026, 11, 27, 6).millisecondsSinceEpoch ~/ 1000;

/// Realistic `GET /weather?q=Manila&units=metric` body.
Map<String, dynamic> _manilaJson() => {
  'coord': {'lon': 120.9822, 'lat': 14.6042},
  'weather': [
    {
      'id': 803,
      'main': 'Clouds',
      'description': 'broken clouds',
      'icon': '04d',
    },
  ],
  'base': 'stations',
  'main': {
    'temp': 30, // int where a double is expected
    'feels_like': 35.21,
    'temp_min': 29.42,
    'temp_max': 31,
    'pressure': 1008,
    'humidity': 70,
    'sea_level': 1008,
    'grnd_level': 1007,
  },
  'visibility': 10000,
  'wind': {'speed': 4, 'deg': 250}, // int speed
  'clouds': {'all': 75},
  'dt': _dt,
  'sys': {
    'type': 2,
    'id': 2008256,
    'country': 'PH',
    'sunrise': 1764194160,
    'sunset': 1764235200,
  },
  'timezone': 28800,
  'id': 1701668,
  'name': 'Manila',
  'cod': 200,
};

void main() {
  group('CurrentWeatherModel.fromJson', () {
    test('parses a full response, converting ints to doubles', () {
      final model = CurrentWeatherModel.fromJson(_manilaJson());

      expect(model.name, 'Manila');
      expect(model.dt, _dt);
      expect(model.timezone, 28800);
      expect(model.main.temp, 30.0);
      expect(model.main.temp, isA<double>());
      expect(model.main.feelsLike, 35.21);
      expect(model.main.tempMin, 29.42);
      expect(model.main.tempMax, 31.0);
      expect(model.main.humidity, 70);
      expect(model.main.pressure, 1008);
      expect(model.wind.speed, 4.0);
      expect(model.wind.speed, isA<double>());
      expect(model.weather.single.main, 'Clouds');
      expect(model.weather.single.description, 'broken clouds');
      expect(model.weather.single.icon, '04d');
      expect(model.sys.country, 'PH');
    });

    test('leaves country null when sys.country is missing', () {
      final json = _manilaJson()..['sys'] = {'sunrise': 1, 'sunset': 2};

      final model = CurrentWeatherModel.fromJson(json);

      expect(model.sys.country, isNull);
    });

    test('uses defaults when sys, wind and timezone are missing', () {
      final json = _manilaJson()
        ..remove('sys')
        ..remove('wind')
        ..remove('timezone');

      final model = CurrentWeatherModel.fromJson(json);

      expect(model.sys.country, isNull);
      expect(model.wind.speed, 0.0);
      expect(model.timezone, 0);
    });

    test('parses an empty weather list', () {
      final json = _manilaJson()..['weather'] = <dynamic>[];

      final model = CurrentWeatherModel.fromJson(json);

      expect(model.weather, isEmpty);
    });
  });

  group('CurrentWeatherModel.toEntity', () {
    test(
      'maps every field and uses city-local time (dt + timezone) in UTC',
      () {
        final entity = CurrentWeatherModel.fromJson(_manilaJson()).toEntity();

        expect(
          entity,
          CurrentWeatherEntity(
            cityName: 'Manila',
            country: 'PH',
            dateTime: DateTime.utc(2026, 11, 27, 14),
            temperature: 30,
            feelsLike: 35.21,
            tempMin: 29.42,
            tempMax: 31,
            humidity: 70,
            pressure: 1008,
            windSpeed: 4,
            condition: 'Clouds',
            description: 'broken clouds',
            iconCode: '04d',
          ),
        );
        expect(entity.dateTime.isUtc, isTrue);
      },
    );

    test('applies a negative timezone offset', () {
      final json = _manilaJson()
        ..['name'] = 'New York'
        ..['timezone'] = -18000;

      final entity = CurrentWeatherModel.fromJson(json).toEntity();

      expect(entity.dateTime, DateTime.utc(2026, 11, 27, 1));
    });

    test('maps a missing country to an empty string', () {
      final json = _manilaJson()..['sys'] = <String, dynamic>{};

      final entity = CurrentWeatherModel.fromJson(json).toEntity();

      expect(entity.country, '');
    });

    test('falls back to default condition values when weather is empty', () {
      final json = _manilaJson()..['weather'] = <dynamic>[];

      final entity = CurrentWeatherModel.fromJson(json).toEntity();

      expect(entity.condition, '');
      expect(entity.description, '');
      expect(entity.iconCode, '01d');
    });
  });
}
