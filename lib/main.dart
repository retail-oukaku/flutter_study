
import 'package:flutter/material.dart';
import 'kadai1/count_up_page.dart';

import 'kadai2/todo_list_page.dart';
import 'kadai3/stop_watch_page.dart';

import 'kadai4/barcode_scan_page.dart';
import 'kadai5/search_user_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: const Home(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

// 画面遷移をする部分のコード
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter study'),
      ),
      body: ListView(
        children:[
          _menuItem('課題1', const Icon(Icons.settings),context),
          _menuItem('課題2', const Icon(Icons.map),context),
          _menuItem('課題3', const Icon(Icons.room),context),
          _menuItem('課題4', const Icon(Icons.local_shipping),context),
          _menuItem('課題5', const Icon(Icons.airplanemode_active),context),
        ],
      ),
    );
  }
  Widget _menuItem(String title, Icon icon,BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row (
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: icon,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) {
              switch(title) {
                case '課題1':
                  return const CountUpPage();
                case '課題2':
                  return const TodoListPage();
                case '課題3':
                  return const StopWatchPage();
                case '課題4':
                  return const BarcodeScanPage();
                case '課題5':
                  return const SearchUserPage();
                default:
                  return const CountUpPage();
              }
            },
          ),
        );
      },
    );
  }
}
