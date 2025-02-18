import 'package:flutter/material.dart';
import 'package:faker/faker.dart'
    as faker; // ** Importar el paquet de faker (alias faker per no confondre Image)

void main() {
  runApp(const MainApp());
}

/*
 * Fer que els botons canviin de página
 */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Instanciació del Faker
    final fakerInstance = faker.Faker();
    // Generació de 6 frases aleatòries
    final List<String> texts = List.generate(6, (_) {
      final sentence = fakerInstance.lorem.sentence();
      print(sentence); // Print the generated sentence
      return sentence;
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Acción al presionar el icono de hamburguesa
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Acció al presionar la icona de cerca
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Acció al presionar el icono de més opcions (els tres punts verticals)
              },
            ),
          ],
        ),
        //Centra els elements
        body: Center(
          //Layout tipus columna
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text amb propietats
              const Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              // Espai entre text i botó
              const SizedBox(height: 16),
              // Botó desactivat
              const ElevatedButton(
                onPressed: null,
                child: Text('Press me'),
              ),
              // Espai entre botons
              const SizedBox(height: 16),
              // Botó definit en una classe interna
              const ElevatedButton(
                onPressed: null,
                child: Text('Press me 2'),
              ),
              // Espai entre botons
              const SizedBox(height: 16),
              // Botó definit en una classe que extén ElevatedButton
              const ElevatedButton(
                onPressed: null,
                child: Text('Press me 3'),
              ),
              // Espai entre botons i imatge
              const SizedBox(height: 16),
              // Afegir una imatge
              const Image(
                image: AssetImage('assets/pollo.png'), // Ruta de l'imatge local
                width: 200, // Amplada
                height: 200, // Alçada
              ),
              // *** Afegir les frases generades de manera més Flutter-like
              ...texts.map((text) => Column(
                    children: [
                      Text(text),
                      const SizedBox(height: 16), // Espai entre text
                    ],
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: Row(
            children: [
              const IconButton(
                icon: Icon(Icons.emoji_food_beverage), // Icono de pollo
                onPressed: null,
              ),
              IconButton(
                icon: const Icon(Icons.map),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapScreen()),
                  );
                },
              ),
              const Spacer(),
              const IconButton(
                icon: Icon(Icons.home),
                onPressed: null,
              ),
              const IconButton(
                icon: Icon(Icons.person),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            size: const Size(375, 812), // Proporción del iPhone 13 mini
          ),
          child: child!,
        );
      },
    );
  }
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Acción al presionar el botón del mapa
          },
          child: const Text('Map'),
        ),
      ),
    );
  }
}
