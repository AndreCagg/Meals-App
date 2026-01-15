import "package:flutter/material.dart";
import "package:meals_app/data/favorites.dart";
import "package:meals_app/data/meal.dart";

class Preferiti extends StatefulWidget {
  const Preferiti({super.key});

  State<Preferiti> createState() {
    return _PreferitiState();
  }
}

class _PreferitiState extends State<Preferiti> {
  @override
  Widget build(BuildContext context) {
    List<Meal> favoritesList = favorites.values.toList();

    if (favoritesList.isEmpty) {
      return Center(
        child: Text(
          ":(( Come fa a non piacerti nulla?!",
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (context, index) {
          return Text(favoritesList[index].descrizione);
        },
      );
    }
  }
}
