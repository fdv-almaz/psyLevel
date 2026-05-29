import 'package:flutter/material.dart';
import '../models/health_metrics.dart';
import '../services/stress_calculator.dart';
import '../services/health_data_service.dart';
import 'results_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _heartRateController = TextEditingController();
  final _diastolicPressureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _heartRateController.dispose();
    _diastolicPressureController.dispose();
    super.dispose();
  }

  void _calculateStress() {
    if (_formKey.currentState!.validate()) {
      final heartRate = int.parse(_heartRateController.text);
      final diastolicPressure = int.parse(_diastolicPressureController.text);

      final metrics = HealthMetrics(
        heartRate: heartRate,
        diastolicPressure: diastolicPressure,
      );

      HealthDataService().addMetrics(metrics);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultsScreen(metrics: metrics),
        ),
      );
    }
  }

  String? _validateHeartRate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите ЧСС';
    }
    final heartRate = int.tryParse(value);
    if (heartRate == null) {
      return 'ЧСС должна быть числом';
    }
    if (heartRate <= 0 || heartRate > 200) {
      return 'ЧСС должна быть между 1 и 200';
    }
    return null;
  }

  String? _validateDiastolicPressure(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите ДАД';
    }
    final pressure = int.tryParse(value);
    if (pressure == null) {
      return 'ДАД должна быть числом';
    }
    if (pressure <= 0 || pressure > 200) {
      return 'ДАД должна быть между 1 и 200';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ввод данных'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Введите ваши показатели',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _heartRateController,
                decoration: InputDecoration(
                  labelText: 'ЧСС (пульс) в BPM',
                  prefixIcon: const Icon(Icons.favorite),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: '60-100',
                ),
                keyboardType: TextInputType.number,
                validator: _validateHeartRate,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _diastolicPressureController,
                decoration: InputDecoration(
                  labelText: 'Диастолическое давление (ДАД) в mmHg',
                  prefixIcon: const Icon(Icons.bloodtype),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: '60-90',
                ),
                keyboardType: TextInputType.number,
                validator: _validateDiastolicPressure,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _calculateStress,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Рассчитать стресс'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
