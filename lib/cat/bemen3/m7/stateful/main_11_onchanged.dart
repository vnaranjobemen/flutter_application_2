import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Welcome App')),
        body: const WelcomeForm(),
      ),
    );
  }
}

class WelcomeForm extends StatefulWidget {
  const WelcomeForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeFormState createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  String texto = '';

  void _showWelcomeDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Welcome'),
          content: Text('Hello, $name!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) => texto = value,
            decoration: const InputDecoration(labelText: 'Enter your name'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showWelcomeDialog(texto);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
