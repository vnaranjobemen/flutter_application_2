import 'package:flutter/material.dart';

class TShirtCalculatorScreen extends StatefulWidget {
  const TShirtCalculatorScreen({super.key});

  @override
  _TShirtCalculatorScreenState createState() => _TShirtCalculatorScreenState();
}

class _TShirtCalculatorScreenState extends State<TShirtCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de samarretes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Samarretes',
                hintText: 'Número de samarretes',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text('Talla'),
            RadioListTile(
              title: const Text('Petita (7,9 €)'),
              value: 'small',
              groupValue: null,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: const Text('Mitjana (8,3 €)'),
              value: 'medium',
              groupValue: null,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: const Text('Gran (12,7 €)'),
              value: 'large',
              groupValue: null,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            const Text('Oferta'),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem(
                  value: '10%',
                  child: Text('Descompte del 10%'),
                ),
                DropdownMenuItem(
                  value: 'quantity',
                  child: Text('Descompte per quantitat'),
                ),
              ],
              onChanged: (value) {},
              hint: const Text('Selecciona una oferta'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Precio: 0.0 €',
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
