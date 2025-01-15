import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: "Categorías",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favoritos",
        ),
      ],
    );
  }
}
