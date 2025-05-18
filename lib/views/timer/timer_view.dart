import 'dart:async';
import 'package:flutter/material.dart';
import '../base_view.dart'; // ✅ Asegúrate de que BaseView esté importado correctamente

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int _seconds = 0;
  Timer? _timer;
  bool _isRunning = false;

  /// Iniciar el temporizador
  void _startTimer() {
    if (_isRunning) return; // Evita iniciar múltiples veces
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  /// Pausar el temporizador
  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunning = false;
    }
  }

  /// Reiniciar el temporizador
  void _resetTimer() {
    _pauseTimer();
    setState(() {
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Asegurar que el timer se detiene al cerrar la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Temporizador",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tiempo: $_seconds segundos",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startTimer,
                child: const Text("Iniciar"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _pauseTimer,
                child: const Text("Pausar"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _resetTimer,
                child: const Text("Reiniciar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
