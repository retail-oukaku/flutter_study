
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'news_list_page.dart';
const newsKey = 'newsKey';
class InputKeyPage extends StatefulWidget {
  const InputKeyPage({super.key});

  @override
  State<InputKeyPage> createState() => _InputKeyPageState();
}

class _InputKeyPageState extends State<InputKeyPage> {
  final _itemController = TextEditingController();
  late String oldNewsKey = '';
  @override
  void initState() {
    super.initState();
    _loadKeys();
  }

  Future<void> _loadKeys() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      oldNewsKey = prefs.getString(newsKey) ?? '';
    });
  }

  @override
  void dispose() {
    _itemController.dispose();
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
          title: const Text('課題6'),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              hideKeyboard(context);
            },
            child: Center(
              child: _buildTopWidget(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopWidget(){
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        const Text(
          'Please input NewsKey!',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            controller: _itemController,
            autofocus: true,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              hintText: 'NewKey',
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            if (_itemController.text.isEmpty){
              return;
            }
            _skipToRepositoryList(_itemController.text);
            _saveKey(_itemController.text);
          },
          icon: const Icon(Icons.add),
          label: const Text('追加'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16),
          ),
          onPressed: () {
            _skipToRepositoryList(oldNewsKey);
          },
          child: Text(oldNewsKey),
        ),
      ],
    );
  }
  void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> _skipToRepositoryList(String key) async {
    hideKeyboard(context);
    await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return NewsListPage(newsKey: key,);
        },
      ),
    );
  }

  Future<void> _saveKey(String key) async {
    if (key.isEmpty) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(newsKey, key);
  }

}
