import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../widgets/current_weather.dart';
import '../widgets/hourly_weather.dart';
import '../widgets/daily_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  Future? weatherFuture;

  void fetchWeather() {
    double lat = double.tryParse(latController.text) ?? 0;
    double lon = double.tryParse(lonController.text) ?? 0;

    setState(() {
      weatherFuture = WeatherService().fetchWeather(lat, lon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: latController,
              decoration: const InputDecoration(
                  labelText: 'Latitude', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lonController,
              decoration: const InputDecoration(
                  labelText: 'Longitude', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: weatherFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error fetching data'));
                  } else if (snapshot.hasData) {
                    final data = snapshot.data as Map;
                    return ListView(
                      children: [
                        CurrentWeather(data['current']),
                        HourlyWeather(data['hourly']),
                        DailyWeather(data['daily']),
                      ],
                    );
                  }
                  return const Center(child: Text('Enter latitude & longitude'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
