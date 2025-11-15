import 'dart:convert';
import 'package:http/http.dart' as http;


class WeatherService {
  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code,wind_speed_10m&hourly=temperature_2m,weather_code,wind_speed_10m&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset&forecast_days=10&timezone=Asia%2FDhaka',
    );


    final response = await http.get(url);


    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'current': data['current'],
        'hourly': data['hourly'],
        'daily': data['daily'],
      };
    } else {
      throw Exception('Failed to fetch weather');
    }
  }
}