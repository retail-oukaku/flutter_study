// 画面遷移をする部分のコード
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
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
  late final player = Player();
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
    player.open(Media('assets/video/reissue.mp4'));
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
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Image.asset('assets/images/lake.jpg'),
        // Use [Video] widget to display video output.
        // child: Video(controller: controller),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('お気に入るニュース'),
    //   ),
    //   body: _buildListWidget(),
    // );
  }

  Widget _buildListWidget() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: files.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListCellWidget(index, files[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 24,
        );
      },
    );
  }

  Widget _buildListCellWidget(int index, String itemText) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              (index + 1).toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              itemText,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
