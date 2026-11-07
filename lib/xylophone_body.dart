import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'xylo_note.dart';

class XylophoneBody extends StatefulWidget {
  const XylophoneBody({super.key});

  @override
  State<XylophoneBody> createState() => _XylophoneBodyState();
}

class _XylophoneBodyState extends State<XylophoneBody> {
  // late final AudioPlayer player;

  // @override
  // void initState() {
  //   super.initState();
  //   player = AudioPlayer();
  // }

  // Future<void> playSound(int noteNumber) async {
  //   await player.play(AssetSource('note$noteNumber.wav'));
  // }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  late final List<AudioPool> soundPools;
  // final bool _initialized = false;
  final colors = [
    Colors.purple,
    Colors.blue,
    Colors.indigo,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    initializeSounds();
  }

  Future<void> initializeSounds() async {
    soundPools = await Future.wait(
      List.generate(
        7,
        (index) => AudioPool.create(
          source: AssetSource('note${index + 1}.wav'),
          maxPlayers: 3,
        ),
      ),
    );
  }

  Future<void> playSound(int noteNumber) async {
    await soundPools[noteNumber - 1].start();
  }

  @override
  void dispose() {
    // Clean up the audio pools.
    if (_soundsInitialized) {
      for (final pool in soundPools) {
        pool.dispose();
      }
    }

    super.dispose();
  }

  bool get _soundsInitialized => _initialized;

  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(2),
        child: Column(
          children: List.generate(7, (index) {
            return Expanded(
              child: XyloNote(
                onPressed: () => playSound(index + 1),
                backgroundColor: colors[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}

// children: [
//             XyloNote(
//               backgroundColor: Colors.purple,
//               onPressed: () => playSound(1),
//             ),
//             XyloNote(
//               backgroundColor: Colors.blue,
//               onPressed: () => playSound(2),
//             ),
//             XyloNote(
//               backgroundColor: Colors.indigo,
//               onPressed: () => playSound(3),
//             ),
//             XyloNote(
//               backgroundColor: Colors.green,
//               onPressed: () => playSound(4),
//             ),
//             XyloNote(
//               backgroundColor: Colors.yellow,
//               onPressed: () => playSound(5),
//             ),
//             XyloNote(
//               backgroundColor: Colors.orange,
//               onPressed: () => playSound(6),
//             ),
//             XyloNote(
//               backgroundColor: Colors.red,
//               onPressed: () => playSound(7),
//             ),
//           ],
