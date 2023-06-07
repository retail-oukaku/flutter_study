
import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  final _stopWatch = Stopwatch();
  final _items = <String>[];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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

  Widget _buildTopWidget(){
    return Column(
      children: [
        const SizedBox(
          width: 10,
        ),
        const Text('00:00.88'),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            TextButton(onPressed: () {

            },
              child: const Text('data'),
            ),
            TextButton(onPressed: () {

            },
              child: const Text('data1111'),
            ),
          ],
        ),
      ],
    );
  }

  // 非同期で取得が必要です。streamで
  Widget _buildListWidget()  {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListCellWidget(index, _items[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 20,);
      },
    );
  }

  Widget _buildListCellWidget(int index,String? itemText){
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
          child: Text(itemText!),
        ),
      ],
    );
  }

  void startStopWatch(){
    _stopWatch.start();
    // change button's type text
  }
  void stopWatch(){
    _stopWatch.stop();
    // change button's type text
  }
  void resetStopWatch(){
    _stopWatch.reset();
    // change button's type text
    // clear the rap list

  }
  void rapStopWatch(){
    final lap = _stopWatch.elapsedTicks;

    // get current time
    // add time in rap list
  }
}
