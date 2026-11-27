class ApiConstants{
  static late final String authBaseUrl;

  static void setEnvironment(String env){
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