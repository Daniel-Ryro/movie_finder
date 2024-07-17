import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:moviefinder/models/movie.dart';
import 'package:moviefinder/providers/movie_provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
        actions: [
          Consumer<MovieProvider>(
            builder: (context, movieProvider, child) {
              final isFavorite = movieProvider.favorites.contains(movie);
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  movieProvider.toggleFavorite(movie);
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.imageUrl != null && movie.imageUrl!.isNotEmpty)
              Center(
                child: Image.network(
                  movie.imageUrl!,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 20.h),
            Text(
              movie.name,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            if (movie.description != null)
              Text(
                movie.description!,
                style: TextStyle(fontSize: 16.sp),
              ),
            SizedBox(height: 10.h),
            Text(
              'Type: ${movie.type}',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
            ),
            SizedBox(height: 5.h),
            Text(
              'Year: ${movie.year}',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
            ),
            SizedBox(height: 5.h),
            if (movie.genres != null)
              Text(
                'Genres: ${movie.genres}',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
              ),
            SizedBox(height: 5.h),
            if (movie.userScore != null)
              Text(
                'User Score: ${movie.userScore}',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
              ),
            if (movie.criticScore != null)
              Text(
                'Critic Score: ${movie.criticScore}',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
              ),
          ],
        ),
      ),
    );
  }
}
