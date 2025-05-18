import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:hola_mundo/provider/theme_provider.dart';

class ChangeThemeView extends StatefulWidget {
  const ChangeThemeView({Key? key}) : super(key: key);

  @override
  State<ChangeThemeView> createState() => _ChangeThemeViewState();
}

class _ChangeThemeViewState extends State<ChangeThemeView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color pickerColor = themeProvider.color;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Tema'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeProvider.color,
              ),
              child: const Text(
                'Cambiar Color',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Escoge un color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: (Color color) {
                            pickerColor = color;
                          },
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Listo'),
                          onPressed: () {
                            themeProvider.setColor(pickerColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(themeProvider.isDarkMode ? 'Activar Modo Claro' : 'Activar Modo Oscuro'),
              onPressed: () {
                themeProvider.toggleThemeMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}