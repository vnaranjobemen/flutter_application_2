import 'package:flutter/material.dart';
import 'package:faker/faker.dart'
    as faker; // ** Importar el paquet de faker (alias faker per no confondre Image)

void main() {
  runApp(const MainApp());
}

/*
 * Afegir una Lista de textos generats amb faker
 */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // *** Instanciació del Faker
    final fakerInstance = faker.Faker();
    // *** Generació de 6 frases aleatòries
    final List<String> texts =
        List.generate(6, (_) => fakerInstance.lorem.sentence());
    // Amb concatenació de text :
    //final List<String> texts =List.generate(6, (index) => '${index + 1}. ${fakerInstance.lorem.sentence()}');
    // Amb vàries línies:
    // final List<String> texts = List.generate(6, (_) {
    //   final sentence = fakerInstance.lorem.sentence();
    //   print(sentence); // Print the generated sentence
    //   return sentence;
    // });

    return MaterialApp(
      home: Scaffold(
        //Centra els elements
        body: Center(
          //Layout tipus columna
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text amb propietats
              const Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              // Espai entre text i botó
              const SizedBox(height: 16),
              // Botó desactivat
              const ElevatedButton(
                onPressed: null,
                child: Text('Press me'),
              ),
              // Espai entre botons
              const SizedBox(height: 16),
              // Botó definit en una classe interna
              const MyButton(),
              // Espai entre botons
              const SizedBox(height: 16),
              // Botó definit en una classe que extén ElevatedButton
              const MyButton2(),
              // Espai entre botons i imatge
              const SizedBox(height: 16),
              // Afegir una imatge
              const Image(
                image: AssetImage('assets/pollo.png'), // Ruta de l'imatge local
                width: 200, // Amplada
                height: 200, // Alçada
              ),
              // *** No es potAfegir les frases generades de la manera classica
              // *** Hem de tenir en compte, que estem a la llista de children
              // *** Això no es pot fer:
              // for (int i = 0; i < texts.length; i++) {
              //   Text(texts[i]),
              //   const SizedBox(height: 16), // Espai entre text
              // },
              // *** S'han afegir les frases generades amb un for i l'operador de propagació
              for (int i = 0; i < texts.length; i++) ...[
                Text(texts[i]),
                const SizedBox(height: 16), // Espai entre text
              ],
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
