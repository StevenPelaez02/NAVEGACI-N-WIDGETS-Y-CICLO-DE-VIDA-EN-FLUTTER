import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hola_mundo/views/base_view.dart';

class FutureView extends StatefulWidget {
  const FutureView({super.key});

  @override
  State<FutureView> createState() => _FutureViewState();
}

class _FutureViewState extends State<FutureView> {
  List<String> _nombres = []; //forma para declarar una lista.

  @override
  // !inicializa el estado
  // *llama a la funcion obtenerDatos() para cargar los datos al iniciar
  void initState() {
    super.initState();
    obtenerDatos(); // carga al iniciar
  }

  // !Funcion que simula una carga de datos
  //*espera 5 segundos antes de cargar los datos, esto simula una carga de datos.
  Future<List<String>> cargarNombres() async {
    //future.delayed() simula una carga de datos
    await Future.delayed(const Duration(seconds: 5));
    return [
      "Steven Rengifo",
      "Kevin Cano",
      "Antonio Ortega",
      "Santiago Diaz",
      "Camilo Pabon"
    ];
  }

  // !Funcion que obtiene los datos
  // *carga los datos y los asigna a la lista _nombres
  Future<void> obtenerDatos() async {
    final datos = await cargarNombres();

    //!mounted es una propiedad de State que indica si el widget está montado en el árbol de widgets
    //mounted es true si el widget está montado en el árbol de widgets
    //mounted es false si el widget no está montado en el árbol de widgets
    if (!mounted) return;
    setState(() {
      _nombres = datos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Estudiantes', // Cambiado el título para reflejar el uso de ListView
      body:
          //*si la lista esta vacia muestra un CircularProgressIndicator
          _nombres.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder( // Usamos ListView.builder
                    itemCount: _nombres.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 87, 194,
                            180), // Mantiene el color de las tarjetas
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal:
                                  16.0), // Añade padding para el contenido
                          child: Row( // Usamos una Row para el icono y el texto
                            children: [
                              const Icon(Icons.person), // Icono de persona
                              const SizedBox(
                                  width:
                                      10), // Espacio entre el icono y el texto
                              Text(
                                // Muestra el nombre
                                _nombres[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
