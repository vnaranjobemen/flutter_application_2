// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
 * Afegir una imatge a l'aplicació
 */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        //Centra els elements
        body: Center(
          //Layout tipus columna
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text amb propietats
              Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              // Espai entre text i botó
              SizedBox(height: 16),
              // Botó desactivat
              ElevatedButton(
                onPressed: null,
                child: Text('Press me'),
              ),
              // Espai entre botons
              SizedBox(height: 16),
              // Botó definit en una classe interna
              MyButton(),
              // Espai entre botons
              SizedBox(height: 16),
              // Botó definit en una classe que extén ElevatedButton
              MyButton2(),
              // Espai entre botons i imatge
              SizedBox(height: 16),
              // Afegir una imatge
              Image(
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
        print('Button 2 pressed');
      },
      child: const Text('Press me 2'),
    );
  }
}

class MyButton2 extends ElevatedButton {
  const MyButton2({super.key})
      : super(
          // Abans d'executar el costructor de la línia superior, s'executa el següent:
          onPressed: null,
          child: const Text('Press me 3'),
        );
}
