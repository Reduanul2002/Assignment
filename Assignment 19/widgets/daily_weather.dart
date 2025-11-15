import 'package:flutter/material.dart';


class DailyWeather extends StatelessWidget {
  final Map data;
  const DailyWeather(this.data, {super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('10-Day Forecast', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data['temperature_2m_max'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Day ${index + 1}'),
                  subtitle: Text('High: ${data['temperature_2m_max'][index]}°C Low: ${data['temperature_2m_min'][index]}°C'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}