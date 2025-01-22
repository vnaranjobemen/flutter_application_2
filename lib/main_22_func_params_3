import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
 * La classe ListJoiner rep dues llistes, 
 * i té un mètode que permet a qui el crida  
 * fer l'operació que vulgui amb els elements de les dues llistes
 */

class ListJoiner {
  final List<int> list1;
  final List<int> list2;

  ListJoiner(this.list1, this.list2);

  List<int> sumLists() {
    int length = list1.length < list2.length ? list1.length : list2.length;
    List<int> result = [];
    for (int i = 0; i < length; i++) {
      result.add(list1[i] + list2[i]);
    }
    return result;
  }

  List<int> restLists() {
    int length = list1.length < list2.length ? list1.length : list2.length;
    List<int> result = [];
    for (int i = 0; i < length; i++) {
      result.add(list1[i] - list2[i]);
    }
    return result;
  }

  List<String> joinLists(String Function(int, int) operation) {
    int length = list1.length < list2.length ? list1.length : list2.length;
    List<String> result = [];
    for (int i = 0; i < length; i++) {
      result.add(operation(list1[i], list2[i]));
    }
    return result;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list1 = [1, 2, 3];
    List<int> list2 = [4, 5, 6];
    ListJoiner listJoiner = ListJoiner(list1, list2);
    // List<int> joinedList = listJoiner.sumLists();
    // List<int> joinedList = listJoiner.restLists();
    List<String> joinedList =
        listJoiner.joinLists((a, b) => (a * b).toString());
    //listJoiner.joinLists((a, b) => (a + b).toString());
    //listJoiner.joinLists((a, b) => (a - b).toString());
    //listJoiner.joinLists((a, b) => (a / b).toString());

    return MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Item: ${joinedList[0]}'),
            Text('Item: ${joinedList[1]}'),
            Text('Item: ${joinedList[2]}'),
          ],
        ),
      ),
    );
  }
}
