import "dart:math";

import "package:flutter/material.dart";
import "package:meals_app/data/favorites.dart";
import "package:meals_app/data/categories.dart";
import "package:meals_app/widget/category_card.dart";

class Preferiti extends StatefulWidget {
  const Preferiti({super.key});

  State<Preferiti> createState() {
    return _PreferitiState();
  }
}

class _PreferitiState extends State<Preferiti> {
  void aggiornaPreferiti(newFavorites) {
    setState(() {
      favorites = newFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> favoritesCategoriesList = favorites.keys.toList();

    if (favoritesCategoriesList.isEmpty) {
      return Center(
        child: Text(
          ":(( Come fa a non piacerti nulla?!",
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: favoritesCategoriesList.length,
        itemBuilder: (context, index) {
          //mealscard
          //ottieni categoria
          return CategoryCard(
            code: favoritesCategoriesList[index],
            category: categories[favoritesCategoriesList[index]]!.nome,
            openFavorites: true,
            updateFavorites: aggiornaPreferiti,
          );
        },
      );
    }
  }
}
