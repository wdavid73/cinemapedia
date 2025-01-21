import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreenMovies extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreenMovies({
    super.key,
    required this.pageIndex,
  });

  @override
  State<HomeScreenMovies> createState() => _HomeScreenMoviesState();
}

class _HomeScreenMoviesState extends State<HomeScreenMovies>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      keepPage: true,
    );
    super.initState();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    PopularView(),
    FavoritesView(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_pageController.hasClients) {
      _pageController.animateToPage(
        widget.pageIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: widget.pageIndex,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
