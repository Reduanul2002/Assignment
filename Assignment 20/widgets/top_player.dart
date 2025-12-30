import 'package:flutter/material.dart';
import '../models/song.dart';

class TopPlayer extends StatelessWidget {
  final Song song;
  final bool isPlaying;
  final double currentSeconds;
  final ValueChanged<double> onChanged;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const TopPlayer({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.currentSeconds,
    required this.onChanged,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
  });

  String formatTime(int seconds) {
    final min = seconds ~/ 60;
    final sec = seconds % 60;
    return '$min:${sec.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(song.title,
              style:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(song.artist,
              style: const TextStyle(color: Colors.grey)),

          Slider(
            value: currentSeconds,
            max: song.durationSeconds.toDouble(),
            onChanged: onChanged,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatTime(currentSeconds.toInt())),
              Text(formatTime(song.durationSeconds)),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                iconSize: 36,
                onPressed: onPrevious,
              ),
              IconButton(
                icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 40,
                onPressed: onPlayPause,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                iconSize: 36,
                onPressed: onNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
