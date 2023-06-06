
import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  final _items = <String>[];
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
          title: const Text('課題３：ストップウォッチ'),
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
          width: 10,
        ),
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
        return const Divider(height: 30,);
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
          onPressed:() {

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

}