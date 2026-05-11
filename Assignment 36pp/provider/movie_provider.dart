import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieProvider extends ChangeNotifier {
  final List<Movie> _movies = [
    Movie(
      id: '1',
      title: 'Inception',
      image: 'assets/inception.jpg',
      description: 'A thief who steals corporate secrets through dream-sharing technology.',
      rating: 4.8,
    ),
    Movie(
      id: '2',
      title: 'Interstellar',
      image: 'assets/interstellar.jpg',
      description: 'A team travels through a wormhole in space in an attempt to save humanity.',
      rating: 4.9,
    ),
    Movie(
      id: '3',
      title: 'The Dark Knight',
      image: 'assets/dark_knight.jpg',
      description: 'Batman faces the Joker in Gotham City.',
      rating: 4.9,
    ),
  ];

  final List<Movie> _watchlist = [];

  List<Movie> get movies => _movies;
  List<Movie> get watchlist => _watchlist;

  void toggleWatchlist(Movie movie) {
    if (_watchlist.contains(movie)) {
      _watchlist.remove(movie);
    } else {
      _watchlist.add(movie);
    }
    notifyListeners();
  }

  bool isInWatchlist(Movie movie) {
    return _watchlist.contains(movie);
  }
}