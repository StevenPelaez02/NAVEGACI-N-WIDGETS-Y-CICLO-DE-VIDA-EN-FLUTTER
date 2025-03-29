import 'package:flutter/material.dart';
import 'dart:async';
import '../custom_drawer.dart';

class EstudiantesView extends StatefulWidget {
  const EstudiantesView({super.key});

  @override
  _EstudiantesViewState createState() => _EstudiantesViewState();
}

class _EstudiantesViewState extends State<EstudiantesView> {
  List<String> estudiantes = [];

  @override
  void initState() {
    super.initState();
    _cargarEstudiantes();
  }

  Future<void> _cargarEstudiantes() async {
    await Future.delayed(const Duration(seconds: 2)); // Simula la carga de datos
    setState(() {
      estudiantes = [
        "steven Rengifo",
        "Kevin Cano",
        "Antonio Ortega",
        "Santiago Diaz",
        "Camilo Pabon"
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Estudiantes"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Abre el menú lateral
            },
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: estudiantes.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Muestra carga
          : ListView.builder(
              itemCount: estudiantes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(estudiantes[index]),
                  leading: const Icon(Icons.person),
                );
              },
            ),
    );
  }
}
