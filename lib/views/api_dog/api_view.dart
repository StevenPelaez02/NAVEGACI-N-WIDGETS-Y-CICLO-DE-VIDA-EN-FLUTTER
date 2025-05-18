import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detalle_view.dart';
import '../custom_drawer.dart';

class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  List<String> imageUrls = [];
  String? errorMessage;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDogImages();
  }

  Future<void> fetchDogImages() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      List<String> newImages = [];
      for (int i = 0; i < 10; i++) {
        final response = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          newImages.add(data['message']);
        } else {
          throw Exception("Error al cargar las imágenes");
        }
      }
      setState(() {
        imageUrls = newImages;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Error al obtener imágenes. Intenta nuevamente.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dog API")),
      drawer: const CustomDrawer(),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : errorMessage != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(errorMessage!, style: const TextStyle(color: Colors.red, fontSize: 18)),
                      const SizedBox(height: 10),
                      ElevatedButton(onPressed: fetchDogImages, child: const Text("Reintentar"))
                    ],
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      String imageUrl = imageUrls[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalleView(imageUrl: imageUrl),
                            ),
                          );
                        },
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchDogImages,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}