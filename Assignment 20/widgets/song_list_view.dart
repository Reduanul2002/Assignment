import 'package:flutter/material.dart';
import '../models/song.dart';

class SongListView extends StatelessWidget {
  final List<Song> songs;
  final Function(int) onTap;

  const SongListView({
    super.key,
    required this.songs,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text(song.title),
          subtitle: Text(song.artist),
          onTap: () => onTap(index),
        );
      },
    );
  }
}
