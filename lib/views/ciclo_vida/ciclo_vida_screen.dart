import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hola_mundo/views/base_view.dart';

/// !CicloVidaScreen
/// Nos permite entender cómo funciona el ciclo de vida
/// de un StatefulWidget en Flutter.

class CicloVidaScreen extends StatefulWidget {
  const CicloVidaScreen({super.key});

  @override
  State<CicloVidaScreen> createState() => _CicloVidaScreenState();
}

class _CicloVidaScreenState extends State<CicloVidaScreen> {
  String texto = "Texto inicial 🟢";

  /// Se ejecuta una vez cuando la pantalla es creada.
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("🟢 initState() -> La pantalla se ha inicializado");
    }
  }

  /// Se ejecuta cada vez que las dependencias del widget cambian.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      print("🟡 didChangeDependencies() -> Dependencias cambiadas");
    }
  }

  /// Se ejecuta cada vez que el widget es reconstruido.
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("🔵 build() -> Construyendo la pantalla");
    }

    return BaseView(
      title: "Ciclo de Vida en Flutter",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: actualizarTexto,
              child: const Text("Actualizar Texto"),
            ),
          ],
        ),
      ),
    );
  }

  /// Método para actualizar el estado con setState()
  void actualizarTexto() {
    setState(() {
      texto = "Texto actualizado 🟠";
      if (kDebugMode) {
        print("🟠 setState() -> Estado actualizado");
      }
    });
  }

  /// Se ejecuta cuando el widget es eliminado de la memoria.
  @override
  void dispose() {
    if (kDebugMode) {
      print("🔴 dispose() -> La pantalla se ha destruido");
    }
    super.dispose();
  }
}
