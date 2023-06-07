
import 'package:flutter/material.dart';

import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  final _stopWatchTimer = StopWatchTimer();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    _stopWatchTimer.dispose();
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
    return StreamBuilder<List<StopWatchRecord>>(
      stream: _stopWatchTimer.records,
      initialData: const [],
      builder: (BuildContext context,
          AsyncSnapshot<List<StopWatchRecord>> snapshot,) {
        if (snapshot.hasError) {
          return const Text('error');
        }
        final value = snapshot.data;
        if (value!.isEmpty) {
          return const Text('data is empty');
        }
        return ListView.separated(
          shrinkWrap: true,
          itemCount: value.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildListCellWidget(index, value[index].displayTime);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 20,);
          },
        );
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
    _stopWatchTimer.onStartTimer();
    // change button's type text
  }
  void stopWatch(){
    _stopWatchTimer.onStopTimer();
    // change button's type text
  }
  void resetStopWatch(){
    _stopWatchTimer.onResetTimer();
    // change button's type text
    // clear the rap list

  }
  void rapStopWatch(){
    _stopWatchTimer.onAddLap();
    // get current time
    // add time in rap list
  }
}
