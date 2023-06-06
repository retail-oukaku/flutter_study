
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _itemController = TextEditingController();
  final _itemFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    //监听输入改变
    _itemController.addListener((){
      if (_itemController.text.isNotEmpty) {

      } else {

      }
      debugPrint(_itemController.text);
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
              Navigator.of(context).pop('Back')
            },
          ),
          title: const Text('課題２：ToDoリスト'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopWidget(),
            // _buildListWidget(),
            const Text(
              'Please add some item in your todolist',
            ),
            Row(
              children: [
                const Text(
                  'Item：',
                ),
                IconButton(
                  alignment: Alignment.centerRight,
                  icon: const Icon(Icons.add),
                  onPressed: () => {
                    debugPrint('test onPressed')
                  },
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }

  Widget _buildTopWidget(){
    Widget titleSection = Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
           Expanded(
            child:Form(
              key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: _itemController,
                  focusNode : _itemFocusNode,
                  autofocus: true,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText:'Item',
                    hintText: '項目',
                  ),
                  validator: (v) {
                    if (v!.trim().isNotEmpty) {
                      return null;
                    }

                    return '入力してださい';
                  },
                ),
            ),

          ),
          const SizedBox(
            width: 10.0,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              disabledForegroundColor:Colors.grey[500],
            ),
            onPressed: () {
              _itemFocusNode.unfocus();
              if ((_formKey.currentState as FormState).validate()) {
                debugPrint(_itemController.text);
              } else {
                debugPrint('invalid');
              }
            },
            icon: const Icon(Icons.add),
            label: const Text('追加'),
          )
        ],
      ),
    );
    return titleSection;
  }

  Widget _buildListWidget(){
    Widget listWidget = ListView(
        children: const [
          Text(
            'Please add some item in your todolist',
          ),
        ],
    );
    return listWidget;
  }
}