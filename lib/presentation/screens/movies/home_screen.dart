import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomeScreenMovies extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreenMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          Environment.movieDbKey,
        ),
      ),
    );
  }
}
