import 'package:flutter/material.dart';

class TShirtCalculatorScreen extends StatefulWidget {
  const TShirtCalculatorScreen({super.key});

  @override
  _TShirtCalculatorScreenState createState() => _TShirtCalculatorScreenState();
}

class _TShirtCalculatorScreenState extends State<TShirtCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          MyTextInput(
            labelText: 'Samarretes',
            hintText: 'Número de samarretes',
            keyboardType: TextInputType.number,
          ),
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
    );
  }
}

class MyTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;

  const MyTextInput({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the desired width
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add border
        borderRadius: BorderRadius.circular(8), // Optional: Add border radius
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: InputBorder.none, // Remove default border
          contentPadding: EdgeInsets.all(8), // Add padding inside the border
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
