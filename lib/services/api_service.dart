import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviefinder/exceptions/http_exception.dart';
import 'package:moviefinder/models/movie.dart';
import 'package:moviefinder/utils/constants.dart';
import 'package:moviefinder/widgets/alert_dialog.dart';

class ApiService {
  static final Map<int, Movie> _cachedMovies = {};

  static Future<List<Movie>> fetchMovies(
      String query, BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(
          '${Constants.apiUrl}/search?apiKey=${Constants.apiKey}&search_field=name&search_value=$query'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        final titleResults = jsonResponse['title_results'] as List<dynamic>;

        return await Future.wait(
          titleResults.map((movie) => _fetchMovieDetails(movie['id'] as int)),
        );
      } else {
        throw HttpException('Failed to load movies');
      }
    } catch (e) {
      if (e is HttpException) {
        ErrorDialog.show(context, title: 'Error', message: e.message);
      } else {
        ErrorDialog.show(context,
            title: 'Error', message: 'An unexpected error occurred.');
      }
      rethrow;
    }
  }

  static Future<Movie> _fetchMovieDetails(int movieId) async {
    if (_cachedMovies.containsKey(movieId)) {
      return _cachedMovies[movieId]!;
    }

    try {
      final response = await http.get(Uri.parse(
          '${Constants.apiUrl}/title/$movieId/details/?apiKey=${Constants.apiKey}'));

      if (response.statusCode == 200) {
        final movieDetails = json.decode(response.body) as Map<String, dynamic>;
        final movie = Movie.fromJson(movieDetails);

        _cachedMovies[movieId] = movie;
        return movie;
      } else {
        throw HttpException('Failed to load movie details');
      }
    } catch (e) {
      rethrow;
    }
  }
}
