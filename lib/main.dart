import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviefinder/providers/movie_provider.dart';
import 'package:moviefinder/screens/favorites_screen.dart';
import 'package:moviefinder/screens/home_screen.dart';
import 'package:moviefinder/services/api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return ChangeNotifierProvider(
      create: (context) => MovieProvider(apiService: apiService),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Movie Finder',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
            routes: {
              '/favorites': (context) => const FavoritesScreen(),
            },
          );
        },
      ),
    );
  }
}
