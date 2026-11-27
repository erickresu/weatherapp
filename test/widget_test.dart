import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:try_ko_ulit_clean_arch/features/splash/pages/splash_screen.dart';

void main() {
  testWidgets('Splash screen shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    expect(find.text('Splash Screen'), findsOneWidget);
  });
}
