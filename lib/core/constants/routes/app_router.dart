import 'package:flutter/material.dart';

import '../../../features/splash/pages/splash_screen.dart';
import '../../../features/weather/presentation/pages/weather_page.dart';
import 'routes_name.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.weather:
        return MaterialPageRoute(builder: (_) => const WeatherPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
