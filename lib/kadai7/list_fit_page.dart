// 画面遷移をする部分のコード
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai7/toast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_drop_down.dart';

class ListFitPage extends StatefulWidget {
  const ListFitPage({super.key});

  @override
  State<ListFitPage> createState() => _ListFitPageState();
}

class _ListFitPageState extends State<ListFitPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const sharedPreferencesKey = 'sharedPreferencesKey';
  late String sharedPreferencesText = '';

  late String pathText = '';
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    focusNode.dispose();
  }

  Future<void> saveText(String text) async {
    final prefs = await _prefs;

    setState(() {
      prefs.setString(sharedPreferencesKey, text).then((bool success) {
        if (success) {
          log('success to save');
        } else {
          log('fail to save');
        }
      });
    });
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
              ColoredBox(
                color: Colors.red,
                child: Focus(
                  focusNode: focusNode,
                  child: TextFormField(
                    controller: textEditingController,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
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
              const Text('Preferences'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      focusNode.unfocus();
                      if (textEditingController.text.isEmpty) {
                        return;
                      }
                      saveText(textEditingController.text);
                    },
                    child: const Text('save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _prefs.then((SharedPreferences prefs) {
                        final savedText =
                            prefs.getString(sharedPreferencesKey) ?? '';
                        setState(() {
                          sharedPreferencesText = savedText;
                        });
                      });
                    },
                    child: const Text('get'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showToast(context: context, message: 'toast');
                    },
                    child: const Text('remove'),
                  ),
                  Text(sharedPreferencesText),
                ],
              ),
              const Text('path'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showToast(context: context, message: 'toast');
                    },
                    child: const Text('add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showToast(context: context, message: 'toast');
                    },
                    child: const Text('save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showToast(context: context, message: 'toast');
                    },
                    child: const Text('remove'),
                  ),
                  Text(pathText),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Path file
  /// 拿到存储路径

  Future<String> getTemporaryDirectoryString() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<String> getApplicationDocumentsDirectoryString() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> getExternalStorageDirectoryString() async {
    final directory = await getExternalStorageDirectory();
    return directory?.path ?? '';
  }

// // 创建对文件位置的引用
//   Future<File> get _localFile async {
//     final path = await getApplicationDocumentsDirectoryString();
//     return File('$path/counter.txt');
//   }
//
// // 将数据写入文件
//   Future<File> writeCounter(int counter) async {
//     final file = await _localFile;
//     // Write the file
//     return file.writeAsString('$counter');
//   }
//
// // 从文件中读取数据
//   Future<int> readCounter() async {
//     try {
//       final file = await _localFile;
//       // Read the file
//       final contents = await file.readAsString();
//
//       return int.parse(contents);
//     } catch (e) {
//       return 0;
//     }
//   }
}
