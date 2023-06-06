
import 'package:flutter/material.dart';

import 'kadai2/todo_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Home(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

// 画面遷移をする部分のコード
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter study'),
      ),
      body: ListView(
        children:[
          _menuItem("課題１", const Icon(Icons.settings),context),
          _menuItem("課題2", const Icon(Icons.map),context),
          _menuItem("課題3", const Icon(Icons.room),context),
          _menuItem("課題4", const Icon(Icons.local_shipping),context),
          _menuItem("課題5", const Icon(Icons.airplanemode_active),context),
        ],
      ),
    );
  }
  Widget _menuItem(String title, Icon icon,BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0,color: Colors.grey))
        ),
        child: Row (
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: icon,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        switch (title) {
          case '課題1':
            break;
          case '課題2':
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TodoListPage())
            );
            break;
        }
      },
    );
  }
}