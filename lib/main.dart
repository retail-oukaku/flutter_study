import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter study'),
        ),
        body: ListView(
          children:[
            _menuItem("課題１", const Icon(Icons.settings)),
            _menuItem("課題2", const Icon(Icons.map)),
            _menuItem("課題3", const Icon(Icons.room)),
            _menuItem("課題4", const Icon(Icons.local_shipping)),
            _menuItem("課題5", const Icon(Icons.airplanemode_active)),],
        ),
      ),
    );
  }
  Widget _menuItem(String title, Icon icon) {
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
        print(title);
      },
    );
    
  }
}