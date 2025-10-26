import 'package:flutter/material.dart';
import '../utils/bmi_helper.dart';
import '../widgets/result_card.dart';
import '../widgets/unit_toggle.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _feetController = TextEditingController();
  final _inchController = TextEditingController();

  String weightUnit = 'kg';
  String heightUnit = 'cm';
  double? bmi;
  String category = "";
  Color categoryColor = Colors.transparent;

  void calculateBMI() {
    try {

      double? weight = double.tryParse(_weightController.text);
      double? height = double.tryParse(_heightController.text);
      double? feet = double.tryParse(_feetController.text);
      double? inches = double.tryParse(_inchController.text);


      final result = BmiHelper.calculateBMI(
        weight: weight,
        height: height,
        weightUnit: weightUnit,
        heightUnit: heightUnit == 'ft+in' ? 'ft_in' : heightUnit,
        feet: feet,
        inches: inches,
      );

      if (result == null) {
        showSnack("Please enter valid inputs");
        return;
      }


      final info = BmiHelper.getBmiCategory(result);

      setState(() {
        bmi = result;
        category = info['category'];
        categoryColor = _mapColor(info['color']);
      });
    } catch (e) {
      showSnack("Error calculating BMI");
    }
  }


  Color _mapColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'orange':
        return Colors.orange;
      case 'red':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void showSnack(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Weight Input"),
            const SizedBox(height: 8),
            UnitToggle(
              labels: const ['kg', 'lb'],
              selected: weightUnit,
              onChange: (val) => setState(() => weightUnit = val),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _weightController,
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Enter weight ($weightUnit)",
              ),
            ),
            const SizedBox(height: 20),
            const Text("Height Input"),
            const SizedBox(height: 8),
            UnitToggle(
              labels: const ['cm', 'm', 'ft+in'],
              selected: heightUnit,
              onChange: (val) => setState(() => heightUnit = val),
            ),
            const SizedBox(height: 10),


            if (heightUnit == 'ft+in')
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _feetController,
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Feet",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _inchController,
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Inches",
                      ),
                    ),
                  ),
                ],
              )
            else
              TextField(
                controller: _heightController,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Enter height ($heightUnit)",
                ),
              ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: calculateBMI,
                child: const Text("Calculate BMI"),
              ),
            ),
            const SizedBox(height: 20),
            if (bmi != null)
              ResultCard(
                bmi: bmi!,
                category: category,
                color: categoryColor,
              ),
          ],
        ),
      ),
    );
  }
}
