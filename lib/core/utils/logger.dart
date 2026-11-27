import 'package:logger/logger.dart';

class LoggerUtils {
  static Logger _logger = _build();

  static void init() => _logger = _build();

  static Logger _build() {
    return Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
      ),
    );
  }

  static void logDebug(String message) => _logger.d(message);
  static void logInfo(String message) => _logger.i(message);
  static void logWarning(String message) => _logger.w(message);
  static void logError(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) => _logger.e(message, error: error, stackTrace: stackTrace);
}
