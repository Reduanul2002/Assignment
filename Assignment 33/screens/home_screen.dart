import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/converter_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConverterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Unit Converter")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // Category Dropdown
            DropdownButton<String>(
              value: provider.category,
              items: ["Length", "Weight", "Temperature"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => provider.setCategory(val!),
            ),

            // Input Field
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Value"),
              onChanged: provider.setInputValue,
            ),

            SizedBox(height: 20),

            // From Dropdown
            DropdownButton<String>(
              value: provider.fromUnit,
              items: getUnits(provider.category)
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => provider.setFromUnit(val!),
            ),

            // To Dropdown
            DropdownButton<String>(
              value: provider.toUnit,
              items: getUnits(provider.category)
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => provider.setToUnit(val!),
            ),

            SizedBox(height: 10),

            // Swap Button
            ElevatedButton(
              onPressed: provider.swapUnits,
              child: Text("Swap"),
            ),

            SizedBox(height: 20),

            // Result (Real-time)
            Text(
              "Result: ${provider.result.toStringAsFixed(2)} ${provider.toUnit}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

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