
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  State<GithubPage> createState() => _GithubPageState();
}

class _GithubPageState extends State<GithubPage> {
  final _items = <String>['Ben','Mark','Sony','James','Tonny','Jim',
    'Green','Vinni','Blues','White','Kim','Atos',];

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
          title: const Text('課題５：GitHubリポジトリ'),
        ),
        body: SafeArea(
          child: Container (
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const Text(
                  'Users',
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: _buildListWidget(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _skipToDetail,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _skipToDetail(){
    debugPrint('_skipToDetail');
  }


  Widget _buildListWidget(){
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListCellWidget(index,_items[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 32,);
      },
    );
  }

  Widget _buildListCellWidget(int index,String itemText){
    return GestureDetector (
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 64,
            height: 64,
            child: Image.asset('images/lake.jpg'),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded (
            child: Text(itemText),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      onTap: (){
        debugPrint(itemText);
      },
    );
  }
  
  void _loadData() async {
    // final response = await http.Uri.tryParse("https://api.github.com/users")
  }
}
