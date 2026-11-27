
import 'package:flutter/material.dart';
import 'package:try_ko_ulit_clean_arch/core/constants/routes/routes_name.dart';
import 'package:try_ko_ulit_clean_arch/features/splash/pages/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
