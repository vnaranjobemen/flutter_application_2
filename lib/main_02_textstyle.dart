import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
 * Més propietats de TextStyle
 */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello World",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
        ),
      ),
    );
  }
}
