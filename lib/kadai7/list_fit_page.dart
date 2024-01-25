// 画面遷移をする部分のコード
import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai7/toast.dart';

import 'custom_drop_down.dart';

class ListFitPage extends StatefulWidget {
  const ListFitPage({super.key});

  @override
  State<ListFitPage> createState() => _ListFitPageState();
}

class _ListFitPageState extends State<ListFitPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          title: const Text('OverlayPortal'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CustomDropDown(),
              ElevatedButton(
                onPressed: () {
                  showToast(context: context, message: 'toast');
                },
                child: const Text('Popup'),
              ),
              const CustomDropDown(),
              const Text(
                'many times:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
