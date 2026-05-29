import '../models/health_metrics.dart';

class StressCalculator {
  /// Calculates stress level using the formula: (1 - (ДАД / ЧСС)) × 100
  ///
  /// Parameters:
  /// - heartRate: ЧСС (pulse) in beats per minute (BPM)
  /// - diastolicPressure: ДАД (lower blood pressure) in mmHg
  ///
  /// Returns:
  /// - Stress level as a percentage (0-100)
  /// - Returns 0 if heartRate is 0 (division by zero protection)
  static double calculateStress(int heartRate, int diastolicPressure) {
    if (heartRate == 0) return 0;
    return (1 - (diastolicPressure / heartRate)) * 100;
  }

  /// Calculates stress from HealthMetrics object
  static double calculateStressFromMetrics(HealthMetrics metrics) {
    return calculateStress(metrics.heartRate, metrics.diastolicPressure);
  }

  /// Returns a stress level interpretation
  static String getStressInterpretation(double stressLevel) {
    if (stressLevel < 0) {
      return 'КРИТИЧЕСКИ ВЫСОКИЙ СТРЕСС\n⚠️ Требуется медицинская помощь';
    } else if (stressLevel < 25) {
      return 'Низкий уровень стресса';
    } else if (stressLevel < 50) {
      return 'Средний уровень стресса';
    } else if (stressLevel < 75) {
      return 'Высокий уровень стресса';
    } else {
      return 'КРИТИЧЕСКИЙ УРОВЕНЬ СТРЕССА\n🚨 Требуется срочная помощь';
    }
  }

  /// Returns a color representation of stress level
  static int getStressColor(double stressLevel) {
    if (stressLevel < 0) {
      return 0xFFD32F2F; // Dark Red
    } else if (stressLevel < 25) {
      return 0xFF4CAF50; // Green
    } else if (stressLevel < 50) {
      return 0xFFFFC107; // Amber
    } else if (stressLevel < 75) {
      return 0xFFFF9800; // Orange
    } else {
      return 0xFFF44336; // Red
    }
  }
}
