import 'package:flutter/material.dart';

import 'core/constants/network/flavors.dart';
import 'core/constants/routes/app_router.dart';
import 'core/constants/routes/routes_name.dart';
import 'core/di/injection.dart';
import 'core/utils/logger.dart';

Future<void> runAppWithFlavor(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  LoggerUtils.init();
  FlavorConfig.set(env == 'prod' ? AppFlavor.prod : AppFlavor.test);

  await configureDependencies();

  runApp(
    const MyApp(),
    // MultiBlocProvider(
    //   providers: [BlocProvider(create: (_) => getIt<AuthBloc>())],
    //   child: const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.weather,
      onGenerateRoute: AppRouter.onGenerateRoute,
      // Build only the initial route. The default splits "/weather" into
      // "/" + "/weather", which puts a hidden page under it and a back button on top.
      onGenerateInitialRoutes: (initialRoute) => [
        AppRouter.onGenerateRoute(RouteSettings(name: initialRoute)),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}

// build:
//  flutter pub run build_runner build --delete-conflicting-outputs
//
// run:
// flutter run --flavor dev -t lib/main_test.dart
