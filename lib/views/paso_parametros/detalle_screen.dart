import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// !DetalleScreen
/// es una vista/screen que recibe un parametro desde la navegación, en este caso un boton.
/// También recibeun segundo parametro, el metodo de navegación (go, push, replace)
/// este con el fin de poder redirigir manualmente a la pantalla anterior.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetalleScreen extends StatelessWidget {
  final String parametro;

  const DetalleScreen({super.key, required this.parametro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Parámetro recibido: $parametro',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop(); // Regresa a la pantalla anterior si es posible
                } else {
                  context.go('/paso_parametros'); // En caso de que no pueda hacer pop
                }
              },
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}