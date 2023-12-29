// 画面遷移をする部分のコード
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

import 'draggable_button.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  final GlobalKey _parentKey = GlobalKey();

  final files = [
    'barcode_beep.ogg',
    'beep.wav',
    'button08.mp3',
    'button67.mp3',
    'makase_beep.ogg',
    'msg.mp3',
    'se_maoudamashii_onepoint33.ogg',
    'seikai01.wav',
    'taiko02.mp3',
  ];

  // Create a [Player] to control playback.
  final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  // VideoController(player);
  // late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    // player.open(
    //   Media(
    //     'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4',
    //   ),
    // );
    // player.setAudioDevice(audioDevice)
    // player.open(Media(
    //     'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'));
  }

  @override
  void dispose() {
    player.dispose();
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
          title: const Text('課題７：おとをPlay'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  key: _parentKey,
                  children: [
                    Container(color: Colors.green),
                    const Center(
                      child: Text(
                        'TextWidget',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DraggableButton(
                      childWidget: Container(
                        width: 60,
                        height: 60,
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                        ),
                        child: const ColoredBox(color: Colors.orange),
                      ),
                      parentKey: _parentKey,
                      initialOffset: const Offset(120, 70),
                      // parentKey: _parentKey,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.play_circle),
        ),
      ),
    );
  }

  void _incrementCounter() {
    player.open(Media('asset:///assets/audio/barcode_beep.ogg'));
  }
}
