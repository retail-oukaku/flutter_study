
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
  final _forDialogKey = GlobalKey<FormState>();
  final _dialogController = TextEditingController();
  final _dialogFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
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
                height: 16,
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

  Widget _buildFormWidget(
      GlobalKey formKey,
      TextEditingController controller,
      FocusNode focusNode,){
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: controller,
        focusNode : focusNode,
        autofocus: true,
        decoration: const InputDecoration(
          labelText:'Item',
          hintText: '項目',
        ),
        validator: (v) {
          if (v!.trim().isEmpty) {
            return '入力してださい';
          }
          if (v.length >= 10) {
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
          width: 8,
        ),
        Expanded(
          child:_buildFormWidget(_formKey,_itemController,_itemFocusNode),
        ),
        const SizedBox(
          width: 8,
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
        return const Divider(height: 24,);
        },
    );
  }

  Widget _buildListCellWidget(int index,String itemText){
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Text((index + 1).toString()),
        const SizedBox(
          width: 16,
        ),
        Expanded (
          flex: 2,
          child: Text(itemText),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed:() {
            _showAlertDialog(itemText,index);
          },
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

  void _showAlertDialog(String item,int index) {
    _dialogController.text = item;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: SingleChildScrollView(
            child: _buildFormWidget(
                _forDialogKey,
                _dialogController,
                _dialogFocusNode,
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed:  () {
                  _dialogFocusNode.unfocus();
                  if ((_forDialogKey.currentState!).validate()) {
                    setState(() {
                      _items[index] = _dialogController.text;
                      _dialogController.clear();
                    });
                  } else {
                    debugPrint('invalid');
                  }
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
