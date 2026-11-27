import 'package:flutter/material.dart';

import '../../domain/entities/forecast_entry_entity.dart';
import 'weather_formatters.dart';
import 'weather_icon.dart';

class HourlyForecastStrip extends StatelessWidget {
  const HourlyForecastStrip({super.key, required this.entries});

  final List<ForecastEntryEntity> entries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final entry = entries[i];
          final rain = (entry.precipitationChance * 100).round();
          return Card(
            margin: EdgeInsets.zero,
            child: SizedBox(
              width: 72,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(formatHour(entry.dateTime)),
                  WeatherIcon(entry.iconCode, size: 28),
                  Text(formatTemp(entry.temperature)),
                  Text(
                    rain > 0 ? '$rain%' : '',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
