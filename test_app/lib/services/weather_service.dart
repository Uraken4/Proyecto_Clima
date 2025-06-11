import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';

  Future<WeatherModel> getCurrentWeather(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al obtener el clima actual');
    }
  }

  Future<List<WeatherModel>> getDailyForecast(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['list'] as List)
          .map((item) => WeatherModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Error al obtener el pronóstico diario');
    }
  }
} 