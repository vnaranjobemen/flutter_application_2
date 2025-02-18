import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
* Estructura bàsica de l'aplicació, amb un Text al centre de la pantalla
*/

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Hello World")),
      ),
    );
  }
}
