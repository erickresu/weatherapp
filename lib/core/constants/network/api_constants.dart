class ApiConstants {
  static late final String authBaseUrl;

  static const String openWeatherBaseUrl =
      'https://api.openweathermap.org/data/2.5';

  // From --dart-define-from-file=env/dev.json. Never hardcode the key.
  static const String openWeatherApiKey = String.fromEnvironment(
    'OPENWEATHER_API_KEY',
  );

  static void setEnvironment(String env) {
    switch (env) {
      case 'prod':
        authBaseUrl = 'https://prod.yourdomain.com';
        break;
      case 'test':
        authBaseUrl =
            'https://wandering-nairobi-hlpajkyapmqp.vapor-farm-c1.com';
        break;
      default:
        throw Exception('Unknown backend environment: $env');
    }
  }
}
