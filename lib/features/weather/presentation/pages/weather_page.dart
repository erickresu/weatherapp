import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/city_search_field.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/daily_forecast_list.dart';
import '../widgets/hourly_forecast_strip.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<WeatherBloc>()..add(const WeatherLocationRequested()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            tooltip: 'Use my location',
            icon: const Icon(Icons.my_location),
            onPressed: () => context.read<WeatherBloc>().add(
              const WeatherLocationRequested(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CitySearchField(
                onSubmitted: (city) =>
                    context.read<WeatherBloc>().add(WeatherCitySearched(city)),
              ),
            ),
            Expanded(
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) => switch (state) {
                  WeatherInitial() || WeatherLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  WeatherError(:final message, :final canRetry) => _ErrorView(
                    message: message,
                    canRetry: canRetry,
                  ),
                  WeatherSuccess() => _WeatherContent(state: state),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherContent extends StatelessWidget {
  const _WeatherContent({required this.state});

  final WeatherSuccess state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WeatherBloc>();
    return RefreshIndicator(
      onRefresh: () {
        final done = Completer<void>();
        bloc.add(WeatherRefreshed(completer: done));
        return done.future;
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          CurrentWeatherCard(weather: state.current),
          const SizedBox(height: 24),
          const _SectionTitle('Next 24 hours'),
          HourlyForecastStrip(entries: state.hourly),
          const SizedBox(height: 24),
          const _SectionTitle('5-day forecast'),
          DailyForecastList(days: state.daily),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.canRetry});

  final String message;
  final bool canRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            if (canRetry) ...[
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () =>
                    context.read<WeatherBloc>().add(const WeatherRefreshed()),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
