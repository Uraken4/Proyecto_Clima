import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import '../widgets/forecast_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronóstico del Clima'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.isLoading) {
            return const Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue,
                size: 50.0,
              ),
            );
          }

          if (weatherProvider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${weatherProvider.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => weatherProvider.getCurrentLocationWeather(),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          if (weatherProvider.currentWeather == null) {
            return Center(
              child: ElevatedButton(
                onPressed: () => weatherProvider.getCurrentLocationWeather(),
                child: const Text('Obtener Clima Actual'),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => weatherProvider.getCurrentLocationWeather(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  WeatherCard(weather: weatherProvider.currentWeather!),
                  const SizedBox(height: 16),
                  if (weatherProvider.dailyForecast != null)
                    ForecastList(forecast: weatherProvider.dailyForecast!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 