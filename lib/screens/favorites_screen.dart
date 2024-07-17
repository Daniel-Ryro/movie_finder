import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviefinder/providers/movie_provider.dart';
import 'package:moviefinder/widgets/movie_tile.dart';
import 'package:provider/provider.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(fontSize: 24.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Consumer<MovieProvider>(
          builder: (context, movieProvider, child) {
            return movieProvider.favorites.isEmpty
                ? Center(
                    child: Text(
                      'No favorites yet',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  )
                : ListView.builder(
                    itemCount: movieProvider.favorites.length,
                    itemBuilder: (context, index) {
                      return MovieTile(movie: movieProvider.favorites[index]);
                    },
                  );
          },
        ),
      ),
    );
  }
}
