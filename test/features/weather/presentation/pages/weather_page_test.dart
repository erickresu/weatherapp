import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/current_weather_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/daily_forecast_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/domain/entities/forecast_entry_entity.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:try_ko_ulit_clean_arch/features/weather/presentation/pages/weather_page.dart';

class MockWeatherBloc extends Mock implements WeatherBloc {}

final _current = CurrentWeatherEntity(
  cityName: 'Manila',
  country: 'PH',
  dateTime: DateTime.utc(2026, 11, 27, 14),
  temperature: 30.4,
  feelsLike: 35,
  tempMin: 29,
  tempMax: 31,
  humidity: 70,
  pressure: 1008,
  windSpeed: 4.1,
  condition: 'Clouds',
  description: 'broken clouds',
  iconCode: '04d',
);

final _hourly = [
  for (var i = 0; i < 8; i++)
    ForecastEntryEntity(
      dateTime: DateTime.utc(2026, 11, 27, 15).add(Duration(hours: 3 * i)),
      temperature: 24,
      tempMin: 23,
      tempMax: 25,
      description: 'light rain',
      iconCode: '10d',
      precipitationChance: 0.4,
    ),
];

final _success = WeatherSuccess(
  current: _current,
  hourly: _hourly,
  daily: [
    DailyForecastEntity(
      date: DateTime.utc(2026, 11, 27), // a Friday
      tempMin: 26.6,
      tempMax: 32.2,
      description: 'light rain',
      iconCode: '10d',
    ),
  ],
);

void main() {
  late MockWeatherBloc bloc;
  late StreamController<WeatherState> states;

  setUpAll(() => registerFallbackValue(const WeatherLocationRequested()));

  setUp(() {
    bloc = MockWeatherBloc();
    states = StreamController<WeatherState>.broadcast();
    when(() => bloc.stream).thenAnswer((_) => states.stream);
    when(() => bloc.close()).thenAnswer((_) async {});
  });

  tearDown(() => states.close());

  /// Manual `whenListen`: [state] is the current state; later states can be
  /// pushed through [states].
  Future<void> pumpView(WidgetTester tester, WeatherState state) async {
    when(() => bloc.state).thenReturn(state);
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>.value(
          value: bloc,
          child: const WeatherView(),
        ),
      ),
    );
  }

  testWidgets('shows a spinner while loading', (tester) async {
    await pumpView(tester, const WeatherLoading());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets('shows a spinner in the initial state', (tester) async {
    await pumpView(tester, const WeatherInitial());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows the error message and a Retry button', (tester) async {
    await pumpView(tester, const WeatherError('No internet connection.'));

    expect(find.text('No internet connection.'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('tapping Retry adds WeatherRefreshed', (tester) async {
    await pumpView(tester, const WeatherError('No internet connection.'));

    await tester.tap(find.text('Retry'));
    await tester.pump();

    final event = verify(() => bloc.add(captureAny())).captured.single;
    expect(event, isA<WeatherRefreshed>());
  });

  testWidgets('hides Retry when the error cannot be retried', (tester) async {
    await pumpView(
      tester,
      const WeatherError('City not found.', canRetry: false),
    );

    expect(find.text('City not found.'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets('shows city, temperature and a day row on success', (
    tester,
  ) async {
    // Tall phone-sized surface so the 5-day list is laid out by the ListView.
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await pumpView(tester, _success);

    expect(find.text('Manila, PH'), findsOneWidget);
    expect(find.text('30°'), findsOneWidget);
    expect(find.text('Broken clouds'), findsOneWidget);
    expect(find.text('Fri'), findsOneWidget);
    expect(find.text('27° / 32°'), findsOneWidget);
  });

  testWidgets('rebuilds when the bloc emits a new state', (tester) async {
    await pumpView(tester, const WeatherLoading());
    expect(find.text('Manila, PH'), findsNothing);

    states.add(_success);
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('Manila, PH'), findsOneWidget);
  });

  testWidgets('submitting the search field adds WeatherCitySearched', (
    tester,
  ) async {
    await pumpView(tester, const WeatherLoading());

    await tester.enterText(find.byType(TextField), 'Cebu');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pump();

    verify(() => bloc.add(const WeatherCitySearched('Cebu'))).called(1);
  });

  testWidgets('tapping the search button adds WeatherCitySearched', (
    tester,
  ) async {
    await pumpView(tester, const WeatherLoading());

    await tester.enterText(find.byType(TextField), '  Quezon City ');
    await tester.tap(find.byTooltip('Search'));
    await tester.pump();

    verify(() => bloc.add(const WeatherCitySearched('Quezon City'))).called(1);
  });

  testWidgets('submitting a blank search adds nothing', (tester) async {
    await pumpView(tester, const WeatherLoading());

    await tester.enterText(find.byType(TextField), '   ');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pump();

    verifyNever(() => bloc.add(any()));
  });

  testWidgets('the location button adds WeatherLocationRequested', (
    tester,
  ) async {
    await pumpView(tester, _success);

    await tester.tap(find.byTooltip('Use my location'));
    await tester.pump();

    verify(() => bloc.add(const WeatherLocationRequested())).called(1);
  });

  testWidgets('pull to refresh adds WeatherRefreshed with a completer', (
    tester,
  ) async {
    await pumpView(tester, _success);

    await tester.fling(find.text('Manila, PH'), const Offset(0, 400), 1000);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final event =
        verify(() => bloc.add(captureAny())).captured.single
            as WeatherRefreshed;
    expect(event.completer, isNotNull);
    expect(find.byType(RefreshProgressIndicator), findsOneWidget);

    event.completer!.complete();
    await tester.pumpAndSettle();

    expect(find.byType(RefreshProgressIndicator), findsNothing);
    expect(find.text('Manila, PH'), findsOneWidget);
  });
}
