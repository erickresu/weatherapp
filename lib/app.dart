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
    MyApp(),
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

// build:
//  flutter pub run build_runner build --delete-conflicting-outputs
//
// run:
// flutter run --flavor dev -t lib/main_test.dart
