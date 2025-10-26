class BmiHelper {
  static double? calculateBMI({
    required double? weight,
    required double? height,
    required String weightUnit,
    required String heightUnit,
    double? feet,
    double? inches,
  }) {
    if (weight == null || height == null || weight <= 0) {
      return null;
    }

    double weightKg = 0;
    double heightMeters = 0;


    if (weightUnit == 'kg') {
      weightKg = weight;
    } else if (weightUnit == 'lb') {
      weightKg = weight * 0.453592; // 1 lb = 0.453592 kg
    }


    if (heightUnit == 'cm') {
      heightMeters = height / 100;
    } else if (heightUnit == 'm') {
      heightMeters = height;
    } else if (heightUnit == 'ft_in') {
      // Defensive check
      if (feet == null || feet < 0 || inches == null || inches < 0) {
        return null;
      }


      double safeFeet = feet;
      double safeInches = inches;


      while (safeInches >= 12) {
        safeFeet += 1;
        safeInches -= 12;
      }


      heightMeters = ((safeFeet * 12) + safeInches) * 0.0254;
    }

    // Final check
    if (heightMeters <= 0) return null;


    double bmi = weightKg / (heightMeters * heightMeters);
    return double.parse(bmi.toStringAsFixed(1)); // keep one decimal
  }


  static Map<String, dynamic> getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return {'category': 'Underweight', 'color': 'Blue'};
    } else if (bmi < 25.0) {
      return {'category': 'Normal', 'color': 'Green'};
    } else if (bmi < 30.0) {
      return {'category': 'Overweight', 'color': 'Orange'};
    } else {
      return {'category': 'Obese', 'color': 'Red'};
    }
  }
}
