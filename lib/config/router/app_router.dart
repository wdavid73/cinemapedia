import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreenMovies.name,
      routes: [
        GoRoute(
          path: '/movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
      builder: (context, state) {
        int pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreenMovies(
          pageIndex: pageIndex > 2 || pageIndex < 0 ? 0 : pageIndex,
        );
      },
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
