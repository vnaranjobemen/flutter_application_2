import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

/*
 * S'aplica la programació funcional també al children del Column
 * I s'aprofita per reduir encara més el codi, i donar-li un aspectemés declaratiu
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

    List<String> emojiList = [ '😀','😃','😄','😁','😆','😅','😂','🤣','😊','😇'];

    return MaterialApp(
      home: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ListJoiner(list1, list2)
                .joinLists((a, b) =>'${emojiList[Random().nextInt(emojiList.length)]} $a-$b')
                .map((item) => Text('Item: $item'))
                .toList()),
      ),
    );
  }
}
