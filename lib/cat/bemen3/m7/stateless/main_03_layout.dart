import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
 * Un column layout amb un text i un botó
 * Els layouts més comuns són Column i Row
 * Altres possibles layouts: ListView, GridView, Stack, etc.
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
            ],
          ),
        ),
      ),
    );
  }
}
