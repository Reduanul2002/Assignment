import 'package:flutter/material.dart';

class ConverterProvider extends ChangeNotifier {
  String category = "Length";

  String fromUnit = "Kilometer";
  String toUnit = "Meter";

  double inputValue = 0;
  double result = 0;

  void setCategory(String value) {
    category = value;
    notifyListeners();
  }

  void setFromUnit(String value) {
    fromUnit = value;
    convert();
  }

  void setToUnit(String value) {
    toUnit = value;
    convert();
  }

  void setInputValue(String value) {
    inputValue = double.tryParse(value) ?? 0;
    convert();
  }

  void swapUnits() {
    String temp = fromUnit;
    fromUnit = toUnit;
    toUnit = temp;
    convert();
  }

  // 🔥 Conversion Logic
  void convert() {
    if (category == "Length") {
      result = lengthConvert(inputValue, fromUnit, toUnit);
    } else if (category == "Weight") {
      result = weightConvert(inputValue, fromUnit, toUnit);
    } else if (category == "Temperature") {
      result = temperatureConvert(inputValue, fromUnit, toUnit);
    }
    notifyListeners();
  }

  double lengthConvert(double value, String from, String to) {
    Map<String, double> units = {
      "Meter": 1,
      "Kilometer": 1000,
      "Centimeter": 0.01,
    };

    return value * units[from]! / units[to]!;
  }

  double weightConvert(double value, String from, String to) {
    Map<String, double> units = {
      "Kilogram": 1,
      "Gram": 0.001,
      "Pound": 0.453592,
    };

    return value * units[from]!/ (units[to] ?? 1);
  }

  double temperatureConvert(double value, String from, String to) {
    double celsius;

    // convert to Celsius first
    if (from == "Fahrenheit") {
      celsius = (value - 32) * 5 / 9;
    } else if (from == "Kelvin") {
      celsius = value - 273.15;
    } else {
      celsius = value;
    }

    // convert from Celsius to target
    if (to == "Fahrenheit") {
      return (celsius * 9 / 5) + 32;
    } else if (to == "Kelvin") {
      return celsius + 273.15;
    } else {
      return celsius;
    }
  }
}