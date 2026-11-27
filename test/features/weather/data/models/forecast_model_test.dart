import 'package:flutter_test/flutter_test.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/data/models/forecast_model.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/forecast_entry_entity.dart';

int _unix(DateTime utc) => utc.millisecondsSinceEpoch ~/ 1000;

/// One realistic `list[]` item of `GET /forecast`.
Map<String, dynamic> _item({
  required DateTime utc,
  num temp = 28.5,
  num tempMin = 27.9,
  num tempMax = 28.5,
  num pop = 0.2,
  List<Map<String, dynamic>>? weather,
}) => {
  'dt': _unix(utc),
  'main': {
    'temp': temp,
    'feels_like': 32.1,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'pressure': 1009,
    'sea_level': 1009,
    'grnd_level': 1008,
    'humidity': 76,
    'temp_kf': 0.6,
  },
  'weather':
      weather ??
      [
        {'id': 500, 'main': 'Rain', 'description': 'light rain', 'icon': '10d'},
      ],
  'clouds': {'all': 64},
  'wind': {'speed': 3.6, 'deg': 254, 'gust': 5.1},
  'visibility': 10000,
  'pop': pop,
  'sys': {'pod': 'd'},
  'dt_txt': utc.toIso8601String(),
};

/// Realistic `GET /forecast?q=Manila&units=metric` body (shortened to 3 steps).
Map<String, dynamic> _forecastJson({int timezone = 28800}) => {
  'cod': '200',
  'message': 0,
  'cnt': 3,
  'list': [
    _item(utc: DateTime.utc(2026, 11, 27, 6)),
    _item(
      utc: DateTime.utc(2026, 11, 27, 9),
      temp: 27, // ints where doubles are expected
      tempMin: 26,
      tempMax: 27,
      pop: 0, // int pop
      weather: [
        {
          'id': 803,
          'main': 'Clouds',
          'description': 'broken clouds',
          'icon': '04n',
        },
      ],
    ),
    _item(utc: DateTime.utc(2026, 11, 27, 12), weather: []),
  ],
  'city': {
    'id': 1701668,
    'name': 'Manila',
    'coord': {'lat': 14.6042, 'lon': 120.9822},
    'country': 'PH',
    'population': 1600000,
    'timezone': timezone,
    'sunrise': 1764194160,
    'sunset': 1764235200,
  },
};

void main() {
  group('ForecastResponseModel.fromJson', () {
    test('parses city and every list item', () {
      final model = ForecastResponseModel.fromJson(_forecastJson());

      expect(model.city.name, 'Manila');
      expect(model.city.timezone, 28800);
      expect(model.list, hasLength(3));
      expect(model.list.first.dt, _unix(DateTime.utc(2026, 11, 27, 6)));
      expect(model.list.first.main.temp, 28.5);
      expect(model.list.first.pop, 0.2);
      expect(model.list.first.weather.single.icon, '10d');
    });

    test('converts int temperatures and pop to doubles', () {
      final item = ForecastResponseModel.fromJson(_forecastJson()).list[1];

      expect(item.main.temp, 27.0);
      expect(item.main.temp, isA<double>());
      expect(item.main.tempMin, 26.0);
      expect(item.main.tempMax, 27.0);
      expect(item.pop, 0.0);
      expect(item.pop, isA<double>());
    });

    test('parses an empty weather list on an item', () {
      final item = ForecastResponseModel.fromJson(_forecastJson()).list[2];

      expect(item.weather, isEmpty);
    });

    test('uses defaults when list and city are missing', () {
      final model = ForecastResponseModel.fromJson({'cod': '200'});

      expect(model.list, isEmpty);
      expect(model.city.name, '');
      expect(model.city.timezone, 0);
    });

    test('defaults pop to 0 when missing', () {
      final json = _item(utc: DateTime.utc(2026, 11, 27))..remove('pop');

      expect(ForecastItemModel.fromJson(json).pop, 0.0);
    });
  });

  group('ForecastResponseModel.toEntities', () {
    test('maps items to entries in city-local time (dt + city.timezone)', () {
      final entries = ForecastResponseModel.fromJson(_forecastJson())
          .toEntities();

      expect(entries, [
        ForecastEntryEntity(
          dateTime: DateTime.utc(2026, 11, 27, 14),
          temperature: 28.5,
          tempMin: 27.9,
          tempMax: 28.5,
          description: 'light rain',
          iconCode: '10d',
          precipitationChance: 0.2,
        ),
        ForecastEntryEntity(
          dateTime: DateTime.utc(2026, 11, 27, 17),
          temperature: 27,
          tempMin: 26,
          tempMax: 27,
          description: 'broken clouds',
          iconCode: '04n',
          precipitationChance: 0,
        ),
        ForecastEntryEntity(
          dateTime: DateTime.utc(2026, 11, 27, 20),
          temperature: 28.5,
          tempMin: 27.9,
          tempMax: 28.5,
          description: '',
          iconCode: '01d',
          precipitationChance: 0.2,
        ),
      ]);
      expect(entries.every((e) => e.dateTime.isUtc), isTrue);
    });

    test('applies a negative timezone offset', () {
      final entries = ForecastResponseModel.fromJson(
        _forecastJson(timezone: -18000),
      ).toEntities();

      expect(entries.first.dateTime, DateTime.utc(2026, 11, 27, 1));
    });

    test('returns an empty list when there are no items', () {
      final model = ForecastResponseModel.fromJson({
        'list': <dynamic>[],
        'city': {'timezone': 0},
      });

      expect(model.toEntities(), isEmpty);
    });
  });
}
