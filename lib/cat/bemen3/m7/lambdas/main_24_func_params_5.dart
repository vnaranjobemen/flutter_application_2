import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

/*
 * La classe ListJoiner reduida al mínim
 * Ara per operar sempre es fa servir joinLists
 * S'han eliminat els mètodes sumLists i restLists
 */
class ListJoiner {
  final List<int> list1;
  final List<int> list2;

  ListJoiner(this.list1, this.list2);

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

    List<String> emojiList = [
      '😀',
      '😃',
      '😄',
      '😁',
      '😆',
      '😅',
      '😂',
      '🤣',
      '😊',
      '😇'
    ];

    ListJoiner listJoiner = ListJoiner(list1, list2);
    List<String> joinedList = listJoiner.joinLists((a, b) {
      String emoji = emojiList[Random().nextInt(emojiList.length)];
      return '$emoji $a-$b';
    });

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
