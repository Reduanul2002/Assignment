import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double bmi;
  final String category;
  final Color color;

  const ResultCard({
    super.key,
    required this.bmi,
    required this.category,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Your BMI: ${bmi.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Chip(
              label: Text(
                category,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: color,
            ),
          ],
        ),
      ),
    );
  }
}
