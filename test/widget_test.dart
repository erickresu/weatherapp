import 'package:flutter_test/flutter_test.dart';
import 'package:try_ko_ulit_clean_arch/app.dart';
import 'package:try_ko_ulit_clean_arch/features/splash/pages/splash_screen.dart';

void main() {
  testWidgets('App starts on the splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('Splash Screen'), findsOneWidget);
  });
}
