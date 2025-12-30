import 'package:flutter/material.dart';
import '../data/song_list.dart';
import '../models/song.dart';
import '../widgets/top_player.dart';
import '../widgets/song_list_view.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  int currentIndex = 0;
  bool isPlaying = false;
  double currentSeconds = 0;

  Song get currentSong => songs[currentIndex];

  void playPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void nextSong() {
    setState(() {
      currentIndex = (currentIndex + 1) % songs.length;
      currentSeconds = 0;
    });
  }

  void previousSong() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + songs.length) % songs.length;
      currentSeconds = 0;
    });
  }

  void selectSong(int index) {
    setState(() {
      currentIndex = index;
      currentSeconds = 0;
      isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Music Player')),
      body: Column(
        children: [
          TopPlayer(
            song: currentSong,
            isPlaying: isPlaying,
            currentSeconds: currentSeconds,
            onChanged: (value) {
              setState(() {
                currentSeconds = value;
              });
            },
            onPlayPause: playPause,
            onNext: nextSong,
            onPrevious: previousSong,
          ),
          Expanded(
            child: SongListView(
              songs: songs,
              onTap: selectSong,
            ),
          ),
        ],
      ),
    );
  }
}
