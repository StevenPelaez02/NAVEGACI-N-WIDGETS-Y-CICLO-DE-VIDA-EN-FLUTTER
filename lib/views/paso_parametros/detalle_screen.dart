import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// !DetalleScreen
/// es una vista/screen que recibe un parametro desde la navegación, en este caso un boton.
/// También recibeun segundo parametro, el metodo de navegación (go, push, replace)
/// este con el fin de poder redirigir manualmente a la pantalla anterior.


class DetalleScreen extends StatelessWidget {
  final String parametro;
  final String metodoNavegacion;

  const DetalleScreen({
    Key? key,
    required this.parametro,
    required this.metodoNavegacion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Parámetro: $parametro'),
            Text('Método de Navegación: $metodoNavegacion'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}