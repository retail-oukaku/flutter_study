
import 'dart:ui';

import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});
  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  final _stopWatch = Stopwatch();
  String _counter = '00:00.00';
  bool _isRunning = false;
  // late
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
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => {
              Navigator.of(context).pop('Back'),
            },
          ),
          title: const Text('課題３：ストップウォッチ'),
        ),
        body:SafeArea(
          child: Container (
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  _counter,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                _buildTopWidget(),
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
      ),
    );
  }

  Widget _buildTopWidget(){
    return  Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              _isRunning?_stopStopWatch():_startStopWatch();
            },
            child:_isRunning? const Text('停止') : const Text('開始'),
          ),
        ),
        Expanded(
          child:TextButton(
            onPressed: () {
              _isRunning?_lapStopWatch():_resetStopWatch();
            },
            child: _isRunning? const Text('ラップ') : const Text('リセット'),
          ),
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
        return const Divider(height: 24,);
      },
    );
  }

  Widget _buildListCellWidget(int index, String? itemText){
    return Row(
      children: [
        Expanded(
          child: Text(
            (index + 1).toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded (
          child: Text(
            itemText!,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void _startStopWatch(){
    _stopWatch.start();
    setState(() {
      _isRunning = true;
    });
    _updateElapsedTime();
  }
  void _stopStopWatch(){
    setState(() {
      _isRunning = false;
    });
    _stopWatch.stop();
  }
  void _resetStopWatch(){
    if (_stopWatch.isRunning) {
      _stopWatch.stop();
    }
    _stopWatch.reset();
    setState(() {
      _items.clear();
      _counter = _getTime(_stopWatch.elapsed);
    });
  }
  void _lapStopWatch(){
    if (!_stopWatch.isRunning) {
      return;
    }
    setState(() {
      _items.add(_getTime(_stopWatch.elapsed));
    });
  }

  String _getTime(Duration elapsed){
    final elapsedNumber = elapsed.toString();
    return elapsedNumber.substring(0,elapsedNumber.length - 4);
  }

  void _updateElapsedTime() {
    Future.delayed(const Duration(milliseconds: 10), () {
      if (_stopWatch.isRunning) {
        setState(() {
          _counter = _getTime(_stopWatch.elapsed);
        });
        _updateElapsedTime();
      }
    });
  }
}
