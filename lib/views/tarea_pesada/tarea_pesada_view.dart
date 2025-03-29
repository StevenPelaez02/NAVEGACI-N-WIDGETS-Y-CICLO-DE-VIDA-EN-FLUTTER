import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:hola_mundo/views/base_view.dart';

class TareaPesadaView extends StatefulWidget {
  const TareaPesadaView({super.key});

  @override
  State<TareaPesadaView> createState() => _TareaPesadaViewState();
}

class _TareaPesadaViewState extends State<TareaPesadaView> {
  bool _isProcessing = false;
  int _resultado = 0;

  void _ejecutarTareaPesada() async {
    setState(() {
      _isProcessing = true;
    });

    final ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_sumarNumeros, receivePort.sendPort);

    receivePort.listen((mensaje) {
      if (mounted) {
        setState(() {
          _resultado = mensaje;
          _isProcessing = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Resultado: $_resultado')),
        );
      }
    });
  }

  static void _sumarNumeros(SendPort sendPort) {
    int suma = 0;
    for (int i = 1; i <= 2000000; i++) {
      suma += i;
    }
    sendPort.send(suma);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Tarea Pesada",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isProcessing
                ? const CircularProgressIndicator()
                : Text("Resultado: $_resultado", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isProcessing ? null : _ejecutarTareaPesada,
              child: const Text("Ejecutar Tarea Pesada"),
            ),
          ],
        ),
      ),
    );
  }
}
