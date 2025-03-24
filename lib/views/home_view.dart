import 'package:flutter/material.dart';
import 'package:hola_mundo/views/base_view.dart';
import 'package:hola_mundo/views/contador.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> gridItems = List.generate(6, (index) => 'Elemento ${index + 1}');
  List<String> otherItems = []; // Lista para "Otra Sección"

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void agregarElemento() {
    setState(() {
      if (_tabController.index == 0) {
        gridItems.add('Elemento ${gridItems.length + 1}');
      } else {
        otherItems.add('Widget ${otherItems.length + 1}');
      }
    });
  }

  void eliminarElemento() {
    setState(() {
      if (_tabController.index == 0 && gridItems.isNotEmpty) {
        gridItems.removeLast();
      } else if (_tabController.index == 1 && otherItems.isNotEmpty) {
        otherItems.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Inicio',
      body: Column(
        children: [
          // TabBar
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'GridView'),
              Tab(text: 'Otra Sección'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Primera pestaña: GridView
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: gridItems.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.blueAccent,
                              child: Center(
                                child: Text(
                                  gridItems[index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Segunda pestaña: Otra Sección con lista de widgets dinámicos
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: otherItems.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.greenAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Text(
                                    otherItems[index],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: agregarElemento,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: eliminarElemento,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}