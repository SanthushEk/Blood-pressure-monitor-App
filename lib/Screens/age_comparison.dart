/// Represents a category of blood pressure levels for a specific age range.
class BloodPressureAgeCategory {
  /// Name of the age range.
  final String name;

  /// Minimum systolic blood pressure considered normal for this age range.
  final int minSystolic;

  /// Minimum diastolic blood pressure considered normal for this age range.
  final int minDiastolic;

  /// Normal systolic blood pressure range for this age range.
  final int normalSystolic;

  /// Normal diastolic blood pressure range for this age range.
  final int normalDiastolic;

  /// Maximum systolic blood pressure considered normal for this age range.
  final int maxSystolic;

  /// Maximum diastolic blood pressure considered normal for this age range.
  final int maxDiastolic;

  /// Constructor for BloodPressureAgeCategory.
  BloodPressureAgeCategory({
    required this.name,
    required this.minSystolic,
    required this.minDiastolic,
    required this.normalSystolic,
    required this.normalDiastolic,
    required this.maxSystolic,
    required this.maxDiastolic,
  });
}

/// Retrieves the blood pressure category based on the provided age.
///
/// Determines the appropriate blood pressure category based on the provided age:
/// - Checks the age against predefined age ranges.
/// - Returns the corresponding BloodPressureAgeCategory.
/// - If the age does not fall into any predefined range, it returns a default category indicating an unknown age range with all blood pressure values set to 0.
BloodPressureAgeCategory getBloodPressureCategoryForAge(int age) {
  if (age >= 1 && age <= 5) {
    return BloodPressureAgeCategory(
      name: "Age 1-5 Years",
      minSystolic: 80,
      minDiastolic: 55,
      normalSystolic: 95,
      normalDiastolic: 65,
      maxSystolic: 110,
      maxDiastolic: 81,
    );
  } else if (age >= 6 && age <= 13) {
    return BloodPressureAgeCategory(
      name: "Age 6-13 Years",
      minSystolic: 90,
      minDiastolic: 60,
      normalSystolic: 105,
      normalDiastolic: 70,
      maxSystolic: 115,
      maxDiastolic: 80,
    );
  } else if (age >= 14 && age <= 19) {
    return BloodPressureAgeCategory(
      name: "Age 14-19 Years",
      minSystolic: 105,
      minDiastolic: 73,
      normalSystolic: 117,
      normalDiastolic: 77,
      maxSystolic: 120,
      maxDiastolic: 81,
    );
  } else if (age >= 20 && age <= 24) {
    return BloodPressureAgeCategory(
      name: "Age 20-24 Years",
      minSystolic: 108,
      minDiastolic: 75,
      normalSystolic: 120,
      normalDiastolic: 79,
      maxSystolic: 132,
      maxDiastolic: 83,
    );
  } else if (age >= 25 && age <= 29) {
    return BloodPressureAgeCategory(
      name: "Age 25-29 Years",
      minSystolic: 109,
      minDiastolic: 76,
      normalSystolic: 121,
      normalDiastolic: 80,
      maxSystolic: 133,
      maxDiastolic: 84,
    );
  } else if (age >= 30 && age <= 34) {
    return BloodPressureAgeCategory(
      name: "Age 30-34 Years",
      minSystolic: 110,
      minDiastolic: 77,
      normalSystolic: 122,
      normalDiastolic: 81,
      maxSystolic: 134,
      maxDiastolic: 85,
    );
  } else if (age >= 35 && age <= 39) {
    return BloodPressureAgeCategory(
      name: "Age 35-39 Years",
      minSystolic: 111,
      minDiastolic: 78,
      normalSystolic: 123,
      normalDiastolic: 82,
      maxSystolic: 135,
      maxDiastolic: 86,
    );
  } else if (age >= 40 && age <= 44) {
    return BloodPressureAgeCategory(
      name: "Age 40-44 Years",
      minSystolic: 112,
      minDiastolic: 79,
      normalSystolic: 125,
      normalDiastolic: 83,
      maxSystolic: 137,
      maxDiastolic: 87,
    );
  } else if (age >= 45 && age <= 49) {
    return BloodPressureAgeCategory(
      name: "Age 45-49 Years",
      minSystolic: 115,
      minDiastolic: 80,
      normalSystolic: 127,
      normalDiastolic: 84,
      maxSystolic: 139,
      maxDiastolic: 88,
    );
  } else if (age >= 50 && age <= 54) {
    return BloodPressureAgeCategory(
      name: "Age 50-54 Years",
      minSystolic: 116,
      minDiastolic: 81,
      normalSystolic: 129,
      normalDiastolic: 85,
      maxSystolic: 142,
      maxDiastolic: 89,
    );
  } else if (age >= 55 && age <= 59) {
    return BloodPressureAgeCategory(
      name: "Age 55-59 Years",
      minSystolic: 118,
      minDiastolic: 82,
      normalSystolic: 131,
      normalDiastolic: 86,
      maxSystolic: 144,
      maxDiastolic: 90,
    );
  } else if (age >= 60 && age <= 64) {
    return BloodPressureAgeCategory(
      name: "Age 60-64 Years",
      minSystolic: 121,
      minDiastolic: 83,
      normalSystolic: 137,
      normalDiastolic: 87,
      maxSystolic: 147,
      maxDiastolic: 91,
    );
  } else {
    return BloodPressureAgeCategory(
      name: "Unknown Age Range",
      minSystolic: 0,
      minDiastolic: 0,
      normalSystolic: 0,
      normalDiastolic: 0,
      maxSystolic: 0,
      maxDiastolic: 0,
    );
  }
}
