import 'package:flutter/material.dart';

import '../../domain/entities/daily_forecast_entity.dart';
import 'weather_formatters.dart';
import 'weather_icon.dart';

class DailyForecastList extends StatelessWidget {
  const DailyForecastList({super.key, required this.days});

  final List<DailyForecastEntity> days;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          for (final day in days)
            ListTile(
              leading: WeatherIcon(day.iconCode),
              title: Text(formatWeekday(day.date)),
              subtitle: Text(capitalize(day.description)),
              trailing: Text(
                '${formatTemp(day.tempMin)} / ${formatTemp(day.tempMax)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
        ],
      ),
    );
  }
}
