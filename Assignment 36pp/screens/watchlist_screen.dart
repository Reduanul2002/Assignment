
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';
import '../widgets/movie_card.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Watchlist")),
      body: provider.watchlist.isEmpty
          ? const Center(child: Text("No movies in watchlist"))
          : ListView.builder(
        itemCount: provider.watchlist.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: provider.watchlist[index]);
        },
      ),
    );
  }
}