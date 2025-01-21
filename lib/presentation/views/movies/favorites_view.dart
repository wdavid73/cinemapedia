import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            Text(
              'Ohh no!!',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
            const Text(
              'No tienes películas favoritas',
              style: TextStyle(fontSize: 20, color: Colors.black45),
            ),
            SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: const Text("Empieza a buscar"),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: MovieMasonry(
          movies: favoriteMovies,
          loadNextPage: () =>
              ref.read(favoriteMoviesProvider.notifier).loadNextPage(),
        ),
      ),
    );
  }
}
