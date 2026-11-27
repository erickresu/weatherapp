import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(this.code, {super.key, this.size = 32});

  final String code;
  final double size;

  @override
  Widget build(BuildContext context) {
    final night = code.endsWith('n');
    final (icon, color) = switch (code.length >= 2
        ? code.substring(0, 2)
        : '') {
      '01' =>
        night
            ? (Icons.nightlight_round, Colors.indigo.shade300)
            : (Icons.wb_sunny, Colors.orange),
      '02' => (night ? Icons.nights_stay : Icons.wb_cloudy, Colors.blueGrey),
      '03' || '04' => (Icons.cloud, Colors.blueGrey),
      '09' || '10' => (Icons.water_drop, Colors.blue),
      '11' => (Icons.thunderstorm, Colors.deepPurple),
      '13' => (Icons.ac_unit, Colors.lightBlue),
      '50' => (Icons.blur_on, Colors.grey),
      _ => (Icons.help_outline, Colors.grey),
    };
    return Icon(icon, size: size, color: color);
  }
}
