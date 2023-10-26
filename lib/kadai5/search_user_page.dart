
import 'package:flutter/material.dart';
import 'package:flutter_web_test_project/kadai5/repository_list_page.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({super.key});

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  final _itemController = TextEditingController();
  @override
  void initState() {
    super.initState();
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
          title: const Text('課題５：GitHubリポジトリ'),
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
          height: 32,
        ),
        SizedBox(
          width: 200,
          height: 50,
          child: TextField(
            controller: _itemController,
            autofocus: true,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              hintText: 'ユーザー名',
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
            skipToRepositoryList(_itemController.text);
          },
          icon: const Icon(Icons.search),
          label: const Text('検索'),
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

  Future<void> skipToRepositoryList(String userName) async {
    await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return RepositoryListPage(userName: userName,);
        },
      ),
    );
  }
}
