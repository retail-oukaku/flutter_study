
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _items = <String>[];
  final _itemController = TextEditingController();
  final _itemFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
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
        body: Container(
          color: Colors.grey[50],
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              _buildTopWidget(),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: _buildListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormWidget(){
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: _itemController,
        focusNode : _itemFocusNode,
        autofocus: true,
        decoration: const InputDecoration(
          labelText:'Item',
          hintText: '項目',
        ),
        validator: (v) {
          if (v!.trim().isEmpty) {
            return '入力してださい';
          }
          if (v!.length >= 10) {
            return '項目が長すぎます。';
          }
          if (_items.contains(v)) {
            return '同じ項目が既に存在します';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTopWidget(){
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child:_buildFormWidget(),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            _itemFocusNode.unfocus();
            if ((_formKey.currentState!).validate()) {
              setState(() {
                _items.add(_itemController.text);
                _itemController.clear();
              });
            } else {
              debugPrint('invalid');
            }
          },
          icon: const Icon(Icons.add),
          label: const Text('追加'),
        )
      ],
    );
  }

  Widget _buildListWidget(){
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListCellWidget(index,_items[index]);
        },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 36,);
        },
    );
  }

  Widget _buildListCellWidget(int index,String itemText){
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text((index + 1).toString()),
        const SizedBox(
          width: 10,
        ),
        Expanded (
          flex: 2,
          child: Text(itemText),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed:_showAlertDialog,
          icon:const Icon(Icons.edit),
        ),
        IconButton(
            onPressed:() {
              setState(() {
                _items.removeAt(index);
              });
            },
            icon:const Icon(Icons.delete),
        ),
      ],
    );
  }

  void _showAlertDialog() {
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
            TextButton(
                onPressed:  () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
            ),
            TextButton(
              onPressed:  () {
                Navigator.of(context).pop();
              },
              child: const Text('cancel'),
            ),
          ],
        );
      },
    );
  }
}
