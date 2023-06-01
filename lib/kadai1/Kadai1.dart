
import 'package:flutter/material.dart';

class Kadai1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kadai1'),
        ),
        body: ListView(
          children:const [
            Text("課題１"),
          ],
        ),
      ),
    );
  }
}