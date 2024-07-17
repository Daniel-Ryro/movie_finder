import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviefinder/models/movie.dart';
import 'package:moviefinder/screens/movie_details_screen.dart';
import 'package:moviefinder/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.w),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: (movie.imageUrl != null && movie.imageUrl!.isNotEmpty)
              ? Image.network(
                  movie.imageUrl!,
                  width: 50.w,
                  height: 75.h,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: 50.w,
                  height: 75.h,
                  color: Colors.grey,
                  child: const Icon(Icons.image, color: Colors.white),
                ),
        ),
        title: Text(
          movie.name,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type: ${movie.type}',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
              ),
              Text(
                'Year: ${movie.year}',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        trailing: Consumer<MovieProvider>(
          builder: (context, movieProvider, child) {
            final isFavorite = movieProvider.favorites.contains(movie);
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    movieProvider.toggleFavorite(movie);
                  },
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.w,
                ),
              ],
            );
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
