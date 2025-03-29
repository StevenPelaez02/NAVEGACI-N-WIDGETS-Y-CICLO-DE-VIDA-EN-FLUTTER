import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menú de Navegación', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => context.go('/'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () => context.go('/settings'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => context.go('/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: const Text('Ciclo de Vida'),
            onTap: () => context.go('/ciclo_vida'),
          ),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('Paso de Parámetros'),
            onTap: () => context.go('/paso_parametros'),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Estudiantes'),
            onTap: () => context.go('/estudiantes'),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Temporizador'),
            onTap: () => context.go('/timer'),
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text("Tarea Pesada"),
            onTap: () {
              context.go('/tarea_pesada');
            },
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text("Dog API"),
            onTap: () => context.go('/api_dog')
          ),
        ],
      ),
    );
  }
}
