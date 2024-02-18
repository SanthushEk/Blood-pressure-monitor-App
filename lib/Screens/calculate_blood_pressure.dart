/// Enum representing different categories of blood pressure levels.
enum BloodPressureCategory {
  /// Represents low blood pressure.
  Low,

  /// Represents normal blood pressure.
  Normal,

  /// Represents elevated blood pressure.
  Elevated,

  /// Represents blood pressure in stage 1 hypertension.
  HypertensionStage1,

  /// Represents blood pressure in stage 2 hypertension.
  HypertensionStage2,

  /// Represents hypertensive crisis (severe hypertension).
  HypertensiveCrisis,
}

/// Determines the blood pressure category based on the provided systolic and diastolic blood pressure values.
///
/// Determines the blood pressure category based on the provided systolic and diastolic blood pressure values:
/// - If both systolic and diastolic are <= 90/60, returns Low.
/// - If systolic is between 90-120 and diastolic is between 60-80, returns Normal.
/// - If systolic is between 120-129 and diastolic is < 80, returns Elevated.
/// - If systolic is between 130-139 or diastolic is between 80-89, returns HypertensionStage1.
/// - If systolic is >= 140 or diastolic is >= 90, returns HypertensionStage2.
/// - Otherwise, returns HypertensiveCrisis.
BloodPressureCategory getBloodPressureCategory(int systolic, int diastolic) {
  if (systolic <= 90 && diastolic <= 60) {
    return BloodPressureCategory.Low;
  }

  if ((90 < systolic && systolic < 120) &&
      (60 < diastolic && diastolic <= 80)) {
    return BloodPressureCategory.Normal;
  } else if (systolic >= 120 && systolic <= 129 && diastolic < 80) {
    return BloodPressureCategory.Elevated;
  } else if ((systolic >= 130 && systolic <= 139) ||
      (diastolic > 80 && diastolic <= 89)) {
    return BloodPressureCategory.HypertensionStage1;
  } else if (systolic >= 140 || diastolic >= 90) {
    return BloodPressureCategory.HypertensionStage2;
  } else {
    return BloodPressureCategory.HypertensiveCrisis;
  }
}
