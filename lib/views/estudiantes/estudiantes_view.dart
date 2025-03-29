import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menú de Navegación",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () => context.go('/'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configuración"),
              onTap: () => context.go('/settings'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Perfil"),
              onTap: () => context.go('/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.autorenew),
              title: const Text("Ciclo de Vida"),
              onTap: () => context.go('/ciclo_vida'),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text("Paso de Parámetros"),
              onTap: () => context.go('/paso_parametros'),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text("Estudiantes"),
              onTap: () => context.go('/estudiantes'),
            ),
          ],
        ),
      ),
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
