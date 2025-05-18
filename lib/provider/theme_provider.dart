import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///! Este provider se encarga de gestionar el color del tema de la aplicación.
///! Usa "ChangeNotifier" para que los widgets escuchen los cambios y se redibujen.
class ThemeProvider with ChangeNotifier {
  Color _color = const Color.fromARGB(255, 20, 83, 165);
  bool _isDarkMode = false; // Nuevo: Modo oscuro

  // se usa color get para que el provider pueda acceder al color
  Color get color => _color;
  bool get isDarkMode => _isDarkMode; // Nuevo: Getter para isDarkMode

  /// Constructor: al iniciar el provider, carga el color desde SharedPreferences
  ThemeProvider() {
    _loadColor(); // Al iniciar, busca si ya hay un color guardado
    _loadThemeMode(); // Carga el modo de tema guardado
  }

  //! se encarga de cargar el color guardado en "shared_preferences"
  /// Carga el color guardado en SharedPreferences al iniciar la aplicación.
  Future<void> _loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorGuardado = prefs.getString('color');
    if (colorGuardado != null) {
      // share preferences guarda el color como un string, por lo que se convierte a int
      // y luego a Color, se hace con el fin de que el color se guarde en formato hexadecimal
      _color = Color(int.parse(colorGuardado));
      notifyListeners(); // Notifica para que se actualice la interfaz
    }
  }

  //! se encarga de cambiar el color del tema y guardarlo en "shared_preferences"
  Future<void> setColor(Color newColor) async {
    _color = newColor; // Asigna el nuevo color
    notifyListeners(); // Notifica a los widgets que usan este color

    // Guarda el color en `shared_preferences` como un entero (hexadecimal...)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('color', newColor.value.toRadixString(16));
  }

  //! Nuevo: Carga el modo de tema desde SharedPreferences
  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('darkMode') ?? false; // Usa false como valor predeterminado
    notifyListeners();
  }

  //! Nuevo: Cambia el modo de tema y lo guarda en SharedPreferences
  Future<void> toggleThemeMode() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _isDarkMode);
  }
}