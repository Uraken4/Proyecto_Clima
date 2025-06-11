import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _currentWeather;
  List<WeatherModel>? _dailyForecast;
  bool _isLoading = false;
  String? _error;

  WeatherModel? get currentWeather => _currentWeather;
  List<WeatherModel>? get dailyForecast => _dailyForecast;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getCurrentLocationWeather() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Permiso de ubicación denegado');
        }
      }

      Position position = await Geolocator.getCurrentPosition();
      _currentWeather = await _weatherService.getCurrentWeather(
        position.latitude,
        position.longitude,
      );
      _dailyForecast = await _weatherService.getDailyForecast(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
} 