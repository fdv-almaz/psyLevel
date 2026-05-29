import 'package:flutter_test/flutter_test.dart';
import 'package:psy_level/services/stress_calculator.dart';
import 'package:psy_level/models/health_metrics.dart';

void main() {
  group('StressCalculator', () {
    test('calculateStress with normal values', () {
      final stressLevel = StressCalculator.calculateStress(80, 60);
      expect(stressLevel, 25.0);
    });

    test('calculateStress with high heart rate', () {
      final stressLevel = StressCalculator.calculateStress(100, 60);
      expect(stressLevel.toStringAsFixed(1), '40.0');
    });

    test('calculateStress with zero heart rate', () {
      final stressLevel = StressCalculator.calculateStress(0, 60);
      expect(stressLevel, 0.0);
    });

    test('calculateStress with equal values', () {
      final stressLevel = StressCalculator.calculateStress(80, 80);
      expect(stressLevel, 0.0);
    });

    test('getStressInterpretation for low stress', () {
      final interpretation = StressCalculator.getStressInterpretation(15);
      expect(interpretation, 'Низкий уровень стресса');
    });

    test('getStressInterpretation for high stress', () {
      final interpretation = StressCalculator.getStressInterpretation(85);
      expect(interpretation, 'Очень высокий уровень стресса');
    });

    test('HealthMetrics.calculateStress', () {
      final metrics = HealthMetrics(
        heartRate: 80,
        diastolicPressure: 60,
      );
      expect(metrics.calculateStress(), 25.0);
    });

    test('getStressColor returns correct color for low stress', () {
      final color = StressCalculator.getStressColor(15);
      expect(color, 0xFF4CAF50); // Green
    });

    test('getStressColor returns correct color for high stress', () {
      final color = StressCalculator.getStressColor(85);
      expect(color, 0xFFF44336); // Red
    });
  });
}
