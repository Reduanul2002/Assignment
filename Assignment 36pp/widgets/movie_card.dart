import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../provider/movie_provider.dart';
import '../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: Image.asset(movie.image, width: 50, fit: BoxFit.cover),
          title: Text(movie.title),
          subtitle: Text("⭐ ${movie.rating}"),
          trailing: IconButton(
            icon: Icon(
              provider.isInWatchlist(movie)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              provider.toggleWatchlist(movie);
            },
          ),
        ),
      ),
    );
  }
}