import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'xylo_note.dart';

class XylophoneBody extends StatefulWidget {
  const XylophoneBody({super.key});

  @override
  State<XylophoneBody> createState() => _XylophoneBodyState();
}

class _XylophoneBodyState extends State<XylophoneBody> {
  late final List<AudioPool> soundPools;
  final colors = [
    Colors.purple,
    Colors.blue,
    Colors.indigo,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  final bool _initialized = false;

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
