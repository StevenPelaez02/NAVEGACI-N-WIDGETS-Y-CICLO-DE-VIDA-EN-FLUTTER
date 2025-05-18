import 'dart:convert';
import 'package:hola_mundo/models/dog.dart'; // Cambiado a dog.dart
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DogService {
  // ! Se obtiene la url de la api desde el archivo .env
  final String apiUrl = dotenv.env['DOG_API_URL']!; // Cambiado a DOG_API_URL

  // ! Método para obtener la lista de imágenes de perros
  Future<List<Dog>> getDogs({int limit = 10}) async {
    final response = await http.get(
      Uri.parse('$apiUrl/breeds/image/random/$limit'), // Cambiado a la API de perros
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['message']; // Cambiado a 'message' que contiene la lista de URLs

      //! Se mapea la lista de resultados para obtener el detalle de cada perro (en este caso, solo la URL)
      List<Dog> dogs = results.map((url) {
        return Dog(
          imageUrl: url,
          breed: 'Perro', // Nombre genérico
        );
      }).toList();
      return dogs;
    } else {
      throw Exception('Error al obtener la lista de imágenes de perros.'); // Mensaje de error actualizado
    }
  }
}