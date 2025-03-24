import 'package:flutter/material.dart';
import 'custom_drawer.dart'; // Importa el Drawer personalizado

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton; // Permite un botón flotante opcional

  const BaseView({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton, // Parámetro opcional
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const CustomDrawer(), // Mantiene el drawer en todas las pantallas
      body: body,
      floatingActionButton: floatingActionButton, // Ahora es configurable
    );
  }
}
