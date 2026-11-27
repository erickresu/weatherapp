import 'api_constants.dart';

enum AppFlavor { test, prod }

class FlavorConfig {
  static late final AppFlavor flavor;

  static void set(AppFlavor selectedFlavor) {
    flavor = selectedFlavor;
    switch (selectedFlavor) {
      case AppFlavor.test:
        ApiConstants.setEnvironment('test');
        break;
      case AppFlavor.prod:
        ApiConstants.setEnvironment('prod');
        break;
    }
  }
}
