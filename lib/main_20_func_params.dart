import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
* La classe ListJoiner rep dos llistats d'enters i els suma
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
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list1 = [1, 2, 3];
    List<int> list2 = [4, 5, 6];
    ListJoiner listJoiner = ListJoiner(list1, list2);
    List<int> joinedList = listJoiner.sumLists();

    return MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //children: joinedList.map((item) => Text('Item: $item')).toList(),
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
