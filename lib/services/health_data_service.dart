import '../models/health_metrics.dart';

class HealthDataService {
  static final HealthDataService _instance = HealthDataService._internal();

  final List<HealthMetrics> _healthHistory = [];

  factory HealthDataService() {
    return _instance;
  }

  HealthDataService._internal();

  /// Add health metrics to history
  void addMetrics(HealthMetrics metrics) {
    _healthHistory.add(metrics);
  }

  /// Get all health records
  List<HealthMetrics> getAllMetrics() {
    return List.from(_healthHistory);
  }

  /// Get latest health record
  HealthMetrics? getLatestMetrics() {
    return _healthHistory.isNotEmpty ? _healthHistory.last : null;
  }

  /// Get metrics from the last N days
  List<HealthMetrics> getMetricsFromLastDays(int days) {
    final cutoffDate = DateTime.now().subtract(Duration(days: days));
    return _healthHistory
        .where((metric) => metric.timestamp.isAfter(cutoffDate))
        .toList();
  }

  /// Clear all history
  void clearHistory() {
    _healthHistory.clear();
  }

  /// Remove a specific metric
  void removeMetric(HealthMetrics metrics) {
    _healthHistory.remove(metrics);
  }
}
