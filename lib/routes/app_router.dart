import 'package:go_router/go_router.dart';
import 'package:hola_mundo/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:hola_mundo/views/home_view.dart';
import 'package:hola_mundo/views/paso_parametros/detalle_screen.dart';
import 'package:hola_mundo/views/paso_parametros/paso_parametros_screen.dart';
import 'package:hola_mundo/views/profile_view.dart';
import 'package:hola_mundo/views/settings_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileView(),
    ),
    // Ruta para la pantalla de paso de parámetros
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),
    // Ruta para la pantalla de detalle con parámetro
    GoRoute(
      path: '/detalle/:parametro',
      builder: (context, state) {
        final parametro = state.pathParameters['parametro'] ?? 'Sin dato';
        return DetalleScreen(parametro: parametro);
      },
    ),
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
  ],
);