import 'dart:developer';

import 'package:flutter/material.dart';

import '../kadai6/models/article.dart';

class CountUpPage extends StatefulWidget {
  const CountUpPage({super.key});

  @override
  State<CountUpPage> createState() => _CountUpPageState();
}

class _CountUpPageState extends State<CountUpPage> {
  final int maxCounter = 100;
  int _counter = 0;
  void _incrementCounter() {
    if (_counter < maxCounter) {
      setState(() {
        _counter++;
      });
    } else {
      showAlertDialog();
    }
  }

  void showAlertDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('100が上限です'),
              ],
            ),
          ),
          actions: <Widget>[
            FloatingActionButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => {
              Navigator.of(context).pop('Back'),
            },
          ),
          title: const Text('課題１：カウントアップ'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void testSwitch(
    int value,
    bool testOne,
    Article article,
  ) {
    switch (value) {
      case 0:
        {
          log('now is$value');
        }
      case 1 when testOne:
        {
          log('now is$value testOne is true');
        }
      case 2 when article is TextOneArticle && article.isTextOne:
        {
          log('now is$value article is TextOneArticle');
        }
    }

    final result = switch (article) {
      TextOneArticle(isTextOne: true) => 'isTextOne is true',
      _ => 'default',
    };

    log(result);
  }
}

class TextOneArticle extends Article {
  const TextOneArticle({
    required super.title,
    required super.url,
    required super.publishedAt,
    this.isTextOne = true,
  });

  final bool isTextOne;
}
