import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LaMevaApp(),
    );
  }
}

class LaMevaApp extends StatefulWidget {
  const LaMevaApp({super.key});

  //Puede ser StatelesWidget porque el estado lo controla TextEditController
  @override
  Estat createState() => Estat();
}

class Estat extends State<LaMevaApp> {
  final TextEditingController _controller = TextEditingController(text: 'hola');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts i SnackBars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'nom',
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            ElevatedButton(
              onPressed: () => _mostrarDialeg(_controller.text),
              child: Text('Say Hello alert'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => _mostrarTorrada1(_controller.text),
              child: Text('Say Hello torrada'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => _mostrarTorrada2(_controller.text),
              child: Text('Say Hello torrada 2'),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialeg(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hello'),
          content: Text('Hello $text'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _mostrarTorrada1(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _mostrarTorrada2(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(days: 1), // Duración infinita
        action: SnackBarAction(
          label: 'CLOSE',
          onPressed: () {
            // Código para cerrar la SnackBar
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
