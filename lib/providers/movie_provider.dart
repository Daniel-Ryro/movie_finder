import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moviefinder/exceptions/http_exception.dart';
import 'package:moviefinder/models/movie.dart';
import 'package:moviefinder/services/api_service.dart';
import 'package:moviefinder/widgets/alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieProvider with ChangeNotifier {
  final ApiService apiService;
  List<Movie> _movies = [];
  List<Movie> _favorites = [];

  List<Movie> get movies => _movies;
  List<Movie> get favorites => _favorites;

  MovieProvider({required this.apiService}) {
    _loadFavorites();
  }

  Future<void> fetchMovies(BuildContext context, String query) async {
    try {
      _movies = await ApiService.fetchMovies(query, context);
      notifyListeners();
    } on HttpException catch (error) {
      ErrorDialog.show(context, title: 'Error', message: error.message);
    } catch (error) {
      ErrorDialog.show(context,
          title: 'Error', message: 'An unexpected error occurred.');
    }
  }

  Future<void> toggleFavorite(Movie movie) async {
    final isFavorite = _favorites.contains(movie);
    if (isFavorite) {
      _favorites.remove(movie);
    } else {
      _favorites.add(movie);
    }
    await _saveFavorites();
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteMovies = prefs.getStringList('favorites');
    if (favoriteMovies != null) {
      _favorites =
          favoriteMovies.map((m) => Movie.fromJson(jsonDecode(m))).toList();
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteMovies =
        _favorites.map((movie) => jsonEncode(movie.toJson())).toList();
    await prefs.setStringList('favorites', favoriteMovies);
  }
}
