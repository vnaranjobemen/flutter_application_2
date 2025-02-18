import 'package:flutter/material.dart';
import 'package:faker/faker.dart'
    as faker; // ** Importar el paquet de faker (alias faker per no confondre Image)

void main() {
  runApp(const MainApp());
}

/*
 * Gestió d'estats
 */

class MainApp extends StatefulWidget {
  const MainApp(
      {super.key}); // lo mismo que const MainApp({key? key}): super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainAppState createState() => _MainAppState(); //Clase interna o privada
}

class _MainAppState extends State<MainApp> {
  String buttonText2 = 'Press me 2';
  String buttonText3 = 'Press me 3';

  @override
  Widget build(BuildContext context) {
    // Instanciació del Faker
    final fakerInstance = faker.Faker();
    // Generació de 6 frases aleatòries.  El mateix que List.generate(6, (_) => fakerInstance.lorem.sentence());
    final List<String> texts = List.generate(6, (_) {
      final sentence = fakerInstance.lorem.sentence();
      //print(sentence); // Print the generated sentence
      return sentence;
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Acció en prèmer l'icona de l'hamburguesa
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Acció en prèmer l'icona de cerca
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Acció en prèmer l'icona de més opcions (els tres punts verticals)
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //**Quan hi ha un canvi, es crida a un mètode de la propia clases state, indicant el que es vol fer */
                    buttonText2 = 'presionado 1';
                    buttonText3 = 'presionado 1';
                  });
                },
                child: const Text('Press me'),
              ),
              // Espai entre botons
              const SizedBox(height: 16),
              // Botó definit en una classe interna
              ElevatedButton(
                onPressed: null,
                child: Text(buttonText2),
              ),
              // Espai entre botons
              const SizedBox(height: 16),
              // Botó definit en una classe que extén ElevatedButton
              ElevatedButton(
                onPressed: null,
                child: Text(buttonText3),
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
          child: const Row(
            children: [
              IconButton(
                icon: Icon(Icons.directions_car),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.map),
                onPressed: null,
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: null,
              ),
              IconButton(
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
