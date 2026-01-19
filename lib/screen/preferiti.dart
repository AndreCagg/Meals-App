import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meals_app/provider/favorites_provider.dart';
import 'package:meals_app/data/categories.dart';
import 'package:meals_app/widget/category_card.dart';

class Preferiti extends StatelessWidget {
  const Preferiti({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();
    final favoritesCategoriesList = favoritesProvider.favorites.keys.toList();

    if (favoritesCategoriesList.isEmpty) {
      return const Center(
        child: Text(
          ":(( Come fa a non piacerti nulla?!",
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: favoritesCategoriesList.length,
      itemBuilder: (context, index) {
        final categoryId = favoritesCategoriesList[index];

        return CategoryCard(
          code: categoryId,
          category: categories[categoryId]!.nome,
          openFavorites: true,
        );
      },
    );
  }
}
