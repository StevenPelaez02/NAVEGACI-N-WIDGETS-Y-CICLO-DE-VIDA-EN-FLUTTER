import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hola_mundo/views/base_view.dart';

/// !PasoParametrosScreen - Pantalla de Paso de Parámetros
/// es una vista/screen que permite ingresar un valor
/// y enviarlo a otra vista (DetalleScreen) usando diferentes metodos de navegación.
///
/// Metodos de navegación disponibles:
/// *- go: Reemplaza toda la navegación anterior.
/// *- push: Agrega una nueva pantalla encima de la actual.
/// *- replace: Reemplaza la pantalla actual en la pila de navegación.

class PasoParametrosScreen extends StatefulWidget {
  const PasoParametrosScreen({super.key});

  @override
  State<PasoParametrosScreen> createState() => _PasoParametrosScreenState();
}

class _PasoParametrosScreenState extends State<PasoParametrosScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void goToDetalle() {
    String valor = controller.text.trim();
    if (valor.isNotEmpty) {
      context.push('/detalle/$valor'); // 🔄 Cambiado de go() a push()
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Paso de Parámetros',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese un valor',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: goToDetalle,
              child: const Text('Enviar Parámetro'),
            ),
          ],
        ),
      ),
    );
  }
}