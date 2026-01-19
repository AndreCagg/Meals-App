import "package:flutter/material.dart";
import "package:meals_app/provider/favorites_provider.dart";
import "package:meals_app/widget/meal_card.dart";
import "package:meals_app/data/categories.dart";
import "package:meals_app/data/category.dart";
import "package:meals_app/data/meal.dart";
import "package:meals_app/data/favorites.dart";
import "package:provider/provider.dart";

class CategoryMeals extends StatefulWidget {
  CategoryMeals({super.key});

  CategoryMeals.Category({
    super.key,
    required this.category,
    this.openFavorites = false,
    //this.updateFavorites,
  }) {
    Category? c = categories[category];

    categoryStr = c!.descrizione;
    if (!openFavorites) {
      meals = c.collection;
    }
  }

  int category = 0;
  String categoryStr = "";
  Map<int, Meal> meals = {};
  bool openFavorites = false;
  //void Function(Map<int, List<int>>)? updateFavorites;

  State<CategoryMeals> createState() {
    return _CategoryMealsState();
  }
}

class _CategoryMealsState extends State<CategoryMeals> {
  @override
  Widget build(BuildContext context) {
    var mealsList = [];
    if (widget.openFavorites) {
      var _favoriteProvider = context.read<FavoritesProvider>();
      var mealsId = _favoriteProvider.favorites[widget.category];

      for (int mealId in mealsId!) {
        mealsList.add(categories[widget.category]!.collection[mealId]);
      }
    } else {
      mealsList = widget.meals.values.toList();
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryStr)),
      body: Center(
        child: ListView.builder(
          itemCount: mealsList.length,
          itemBuilder: (context, index) {
            return MealCard(
              category: widget.category,
              id: mealsList[index].id,
              image: mealsList[index].url,
              descrizione: mealsList[index].descrizione,
              //updateFavorites: widget.updateFavorites,
            );
          },
        ),
      ),
    );
  }
}
