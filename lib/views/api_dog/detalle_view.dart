import 'package:flutter/material.dart';

class DetalleView extends StatelessWidget {
  final String imageUrl;

  const DetalleView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Extraer el nombre del archivo desde la URL
    Uri uri = Uri.parse(imageUrl);
    String fileName = uri.pathSegments.last;
    
    // Extraer la raza del nombre de archivo (asumiendo que sigue el formato esperado)
    String breed = uri.pathSegments[uri.pathSegments.length - 2];
    breed = breed.replaceAll('-', ' '); // Formatear raza correctamente

    return Scaffold(
      appBar: AppBar(title: const Text("Detalle de la Imagen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 300, width: 300),
            const SizedBox(height: 20),
            Text("Nombre: $fileName", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 20),
            Text("Raza: ${breed.toUpperCase()}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}