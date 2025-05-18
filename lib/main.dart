import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hola_mundo/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:hola_mundo/routes/app_router.dart';

import 'themes/app_theme.dart'; // Importa el tema

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //! Importante para que funcione el dotenv, inicializa el widget
  await dotenv.load(fileName: ".env"); // Carga el archivo .env
  runApp(const MyApp());

  //! Carga el archivo .env en la raíz del proyecto
  await dotenv.load(fileName: ".env");

  //! Ejecuta la app con Provider
  runApp(
    //!multiprovider permite usar varios providers en la app
    //! en este caso solo se usa el ThemeProvider, pero se pueden agregar más
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //* El provider se encarga de gestionar el color del tema de la app
          //* y notificar a los widgets que lo usan cuando cambia
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //! Obtiene el color actual del ThemeProvider
    final themeColor = Provider.of<ThemeProvider>(context).color;

    //! Obtiene el ThemeProvider para acceder al modo oscuro
    final themeProvider = Provider.of<ThemeProvider>(context);

    // go_router para navegación
    return MaterialApp.router(
      theme: AppTheme.lightTheme(
        themeColor,
      ), //Usa el color...
      darkTheme: AppTheme.darkTheme(themeColor), // Añadido el tema oscuro
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light, // Añadido el modo de tema
      routerConfig: appRouter,
      title: 'Hola Mundo',
    );
  }
}