import 'package:flutter/material.dart';

void main() {
  runApp(const LaMevaAplicacio());
}

class LaMevaAplicacio extends StatelessWidget {
  const LaMevaAplicacio({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaInicial(),
        '/second': (context) => SegonaPantalla(),
      },
    );
  }
}

class PantallaInicial extends StatelessWidget {
  const PantallaInicial({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SegonaPantalla extends StatelessWidget {
  const SegonaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back to Home Screen'),
        ),
      ),
    );
  }
}
