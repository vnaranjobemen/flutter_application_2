// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple App')),
        body: const LaMevaApp(),
      ),
    );
  }
}

class LaMevaApp extends StatefulWidget {
  const LaMevaApp({super.key});

  @override
  Estat createState() => Estat();
}

class Estat extends State<LaMevaApp> {
  String text = 'Good ?!';

  void _canviarText(String newText) {
    //privat
    setState(() {
      text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _canviarText('Good Morning'),
            child: const Text('Morning'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _canviarText('Good Night'),
            child: const Text('Night'),
          ),
        ],
      ),
    );
  }
}
