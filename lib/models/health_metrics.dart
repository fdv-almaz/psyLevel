class HealthMetrics {
  final int heartRate; // ЧСС in BPM
  final int diastolicPressure; // ДАД in mmHg
  final DateTime timestamp;

  HealthMetrics({
    required this.heartRate,
    required this.diastolicPressure,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  double calculateStress() {
    if (heartRate == 0) return 0;
    return (1 - (diastolicPressure / heartRate)) * 100;
  }

  Map<String, dynamic> toJson() {
    return {
      'heartRate': heartRate,
      'diastolicPressure': diastolicPressure,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory HealthMetrics.fromJson(Map<String, dynamic> json) {
    return HealthMetrics(
      heartRate: json['heartRate'] as int,
      diastolicPressure: json['diastolicPressure'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}
