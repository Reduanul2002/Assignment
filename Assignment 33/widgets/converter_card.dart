import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/converter_provider.dart';

class ConverterCard extends StatelessWidget {
  const ConverterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConverterProvider>(context);

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [


            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Value",
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
              onChanged: provider.setInputValue,
            ),

            const SizedBox(height: 15),


            Row(
              children: [


                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: provider.fromUnit,
                    decoration: InputDecoration(
                      labelText: "From",
                      border: OutlineInputBorder(),
                    ),
                    items: getUnits(provider.category)
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                        .toList(),
                    onChanged: (val) => provider.setFromUnit(val!),
                  ),
                ),

                const SizedBox(width: 10),

                // Swap Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: provider.swapUnits,
                    icon: const Icon(Icons.swap_horiz, color: Colors.white),
                  ),
                ),

                const SizedBox(width: 10),

                // To Dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: provider.toUnit,
                    decoration: InputDecoration(
                      labelText: "To",
                      border: OutlineInputBorder(),
                    ),
                    items: getUnits(provider.category)
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                        .toList(),
                    onChanged: (val) => provider.setToUnit(val!),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),


            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Result",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${provider.result.toStringAsFixed(2)} ${provider.toUnit}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Units List
  List<String> getUnits(String category) {
    if (category == "Length") {
      return ["Meter", "Kilometer", "Centimeter"];
    } else if (category == "Weight") {
      return ["Kilogram", "Gram", "Pound"];
    } else {
      return ["Celsius", "Fahrenheit", "Kelvin"];
    }
  }
}