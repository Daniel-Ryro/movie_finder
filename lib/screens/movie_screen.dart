import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviefinder/models/movie.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;

  const MovieScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.imageUrl != null && movie.imageUrl!.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    movie.imageUrl!,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 16.h),
            Text(
              movie.name,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Year: ${movie.year}',
              style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
            ),
            SizedBox(height: 8.h),
            if (movie.description != null)
              Text(
                movie.description!,
                style: TextStyle(fontSize: 16.sp),
              ),
            SizedBox(height: 8.h),
            Text(
              'Type: ${movie.type}',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
            ),
            SizedBox(height: 8.h),
            if (movie.genres != null)
              Text(
                'Genres: ${movie.genres}',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
              ),
            SizedBox(height: 8.h),
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
