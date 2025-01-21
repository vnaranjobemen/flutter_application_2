import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final fakerInstance = faker.Faker();
    final List<String> texts =
        List.generate(10, (_) => fakerInstance.lorem.sentence());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('My Navigation Bar'), // Título de la barra
            backgroundColor: Colors.blue // Color de fondo de la barra
            ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra els elements
            children: [
              for (var text in texts) ...[
                Text(text),
                const SizedBox(height: 16), // Espai entre text
              ],
              const MyButton(), // Instanciar un objecte
              const SizedBox(height: 16), // Espai abans de l'imatge
              // Imagen como hijo de Column
              const Image(
                image: AssetImage('assets/pollo.png'), // Ruta de l'imatge local
                width: 200, // Amplada
                height: 200, // Alçada
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Button pressed');
      },
      child: const Text('press'),
    );
  }
}
