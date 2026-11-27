import 'package:flutter/material.dart';

import '../../domain/entities/current_weather_entity.dart';
import 'weather_formatters.dart';
import 'weather_icon.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key, required this.weather});

  final CurrentWeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final place = weather.country.isEmpty
        ? weather.cityName
        : '${weather.cityName}, ${weather.country}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(place, style: theme.textTheme.headlineSmall),
            Text(
              formatDateTime(weather.dateTime),
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                WeatherIcon(weather.iconCode, size: 64),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatTemp(weather.temperature),
                        style: theme.textTheme.displayMedium,
                      ),
                      Text(capitalize(weather.description)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 24,
              runSpacing: 12,
              children: [
                _Detail(
                  Icons.thermostat,
                  'Feels like',
                  formatTemp(weather.feelsLike),
                ),
                _Detail(
                  Icons.swap_vert,
                  'Min / Max',
                  '${formatTemp(weather.tempMin)} / ${formatTemp(weather.tempMax)}',
                ),
                _Detail(
                  Icons.water_drop_outlined,
                  'Humidity',
                  '${weather.humidity}%',
                ),
                _Detail(
                  Icons.air,
                  'Wind',
                  '${weather.windSpeed.toStringAsFixed(1)} m/s',
                ),
                _Detail(Icons.speed, 'Pressure', '${weather.pressure} hPa'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail(this.icon, this.label, this.value);

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: theme.colorScheme.primary),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: theme.textTheme.labelSmall),
            Text(value, style: theme.textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
