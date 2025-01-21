import 'package:flutter/material.dart';
import 'package:faker/faker.dart'
    as faker; // ** Importar el paquet de faker (alias faker per no confondre Image)

void main() {
  runApp(const MainApp());
}

/*
 * Afegir una Lista de textos generats amb faker
 * Opció 2: d'una manera més Flutter-like, amb unafunció map
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
      ),
    );
  }
}
