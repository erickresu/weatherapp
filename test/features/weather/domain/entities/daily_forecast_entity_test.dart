import 'package:flutter_test/flutter_test.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/daily_forecast_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/forecast_entry_entity.dart';

ForecastEntryEntity _step(
  DateTime time, {
  double min = 20,
  double max = 25,
  String description = 'clear sky',
  String icon = '01d',
}) => ForecastEntryEntity(
  dateTime: time,
  temperature: (min + max) / 2,
  tempMin: min,
  tempMax: max,
  description: description,
  iconCode: icon,
  precipitationChance: 0,
);

void main() {
  group('DailyForecastEntity.fromEntries', () {
    test('returns an empty list for empty input', () {
      expect(DailyForecastEntity.fromEntries(const []), isEmpty);
    });

    test('groups three-hour steps by calendar day', () {
      final entries = [
        for (var h = 0; h < 24; h += 3) _step(DateTime.utc(2026, 11, 27, h)),
        for (var h = 0; h < 24; h += 3) _step(DateTime.utc(2026, 11, 28, h)),
        _step(DateTime.utc(2026, 11, 29)),
      ];

      final days = DailyForecastEntity.fromEntries(entries);

      expect(days.map((d) => d.date), [
        DateTime.utc(2026, 11, 27),
        DateTime.utc(2026, 11, 28),
        DateTime.utc(2026, 11, 29),
      ]);
    });

    test('keeps the date in UTC for UTC (city-local) entries', () {
      final days = DailyForecastEntity.fromEntries([
        _step(DateTime.utc(2026, 11, 27, 21)),
      ]);

      expect(days.single.date, DateTime.utc(2026, 11, 27));
      expect(days.single.date.isUtc, isTrue);
    });

    test('takes the lowest min and highest max across the day', () {
      final days = DailyForecastEntity.fromEntries([
        _step(DateTime.utc(2026, 11, 27, 3), min: 24, max: 26),
        _step(DateTime.utc(2026, 11, 27, 6), min: 22.5, max: 27),
        _step(DateTime.utc(2026, 11, 27, 12), min: 25, max: 31.2),
        _step(DateTime.utc(2026, 11, 27, 21), min: 23, max: 25),
      ]);

      expect(days.single.tempMin, 22.5);
      expect(days.single.tempMax, 31.2);
    });

    test('takes icon and description from the step closest to 12:00', () {
      final days = DailyForecastEntity.fromEntries([
        _step(DateTime.utc(2026, 11, 27, 6), description: 'mist', icon: '50d'),
        _step(DateTime.utc(2026, 11, 27, 9), description: 'haze', icon: '50d'),
        _step(
          DateTime.utc(2026, 11, 27, 12),
          description: 'light rain',
          icon: '10d',
        ),
        _step(
          DateTime.utc(2026, 11, 27, 15),
          description: 'overcast clouds',
          icon: '04d',
        ),
        _step(
          DateTime.utc(2026, 11, 27, 21),
          description: 'clear sky',
          icon: '01n',
        ),
      ]);

      expect(days.single.description, 'light rain');
      expect(days.single.iconCode, '10d');
    });

    test('picks the nearest step to midday when 12:00 is not present', () {
      // City at UTC+8: local steps fall on 02, 05, 08, 11, 14, 17, 20, 23.
      final days = DailyForecastEntity.fromEntries([
        _step(DateTime.utc(2026, 11, 27, 8), description: 'a', icon: '02d'),
        _step(DateTime.utc(2026, 11, 27, 11), description: 'b', icon: '03d'),
        _step(DateTime.utc(2026, 11, 27, 14), description: 'c', icon: '04d'),
      ]);

      expect(days.single.description, 'b');
      expect(days.single.iconCode, '03d');
    });

    test('uses the only available step on a partial day', () {
      final days = DailyForecastEntity.fromEntries([
        _step(
          DateTime.utc(2026, 11, 27, 21),
          min: 18,
          max: 19,
          description: 'clear sky',
          icon: '01n',
        ),
      ]);

      expect(
        days.single,
        DailyForecastEntity(
          date: DateTime.utc(2026, 11, 27),
          tempMin: 18,
          tempMax: 19,
          description: 'clear sky',
          iconCode: '01n',
        ),
      );
    });

    test('sorts days even when entries arrive out of order', () {
      final days = DailyForecastEntity.fromEntries([
        _step(DateTime.utc(2026, 11, 29, 12)),
        _step(DateTime.utc(2026, 11, 27, 12)),
        _step(DateTime.utc(2026, 12, 1, 12)),
        _step(DateTime.utc(2026, 11, 28, 12)),
      ]);

      expect(days.map((d) => d.date), [
        DateTime.utc(2026, 11, 27),
        DateTime.utc(2026, 11, 28),
        DateTime.utc(2026, 11, 29),
        DateTime.utc(2026, 12, 1),
      ]);
    });

    test('groups across a month boundary', () {
      final days = DailyForecastEntity.fromEntries([
        _step(DateTime.utc(2026, 11, 30, 21)),
        _step(DateTime.utc(2026, 12, 1, 0)),
      ]);

      expect(days, hasLength(2));
      expect(days.last.date, DateTime.utc(2026, 12, 1));
    });
  });
}
