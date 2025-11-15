import 'package:flutter/material.dart';


class CurrentWeather extends StatelessWidget {
  final Map data;
  const CurrentWeather(this.data, {super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Current Weather', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text('Temperature: ${data['temperature_2m']}°C'),
            Text('Wind Speed: ${data['wind_speed_10m']} km/h'),
            Text('Weather Code: ${data['weather_code']}'),
          ],
        ),
      ),
    );
  }
}