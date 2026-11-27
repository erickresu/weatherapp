import 'package:equatable/equatable.dart';

import 'forecast_entry_entity.dart';

class DailyForecastEntity extends Equatable {
  const DailyForecastEntity({
    required this.date,
    required this.tempMin,
    required this.tempMax,
    required this.description,
    required this.iconCode,
  });

  final DateTime date;
  final double tempMin;
  final double tempMax;
  final String description;
  final String iconCode;

  static List<DailyForecastEntity> fromEntries(
    List<ForecastEntryEntity> entries,
  ) {
    final byDay = <DateTime, List<ForecastEntryEntity>>{};
    for (final entry in entries) {
      final t = entry.dateTime;
      final day = t.isUtc
          ? DateTime.utc(t.year, t.month, t.day)
          : DateTime(t.year, t.month, t.day);
      byDay.putIfAbsent(day, () => []).add(entry);
    }

    final days = byDay.keys.toList()..sort();
    return [for (final day in days) _summarise(day, byDay[day]!)];
  }

  static DailyForecastEntity _summarise(
    DateTime day,
    List<ForecastEntryEntity> steps,
  ) {
    var min = steps.first.tempMin;
    var max = steps.first.tempMax;
    var representative = steps.first;
    for (final step in steps) {
      if (step.tempMin < min) min = step.tempMin;
      if (step.tempMax > max) max = step.tempMax;
      if ((step.dateTime.hour - 12).abs() <
          (representative.dateTime.hour - 12).abs()) {
        representative = step;
      }
    }
    return DailyForecastEntity(
      date: day,
      tempMin: min,
      tempMax: max,
      description: representative.description,
      iconCode: representative.iconCode,
    );
  }

  @override
  List<Object?> get props => [date, tempMin, tempMax, description, iconCode];
}
