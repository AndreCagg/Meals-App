import "package:flutter/material.dart";
import "package:meals_app/data/categories.dart";
import "package:meals_app/data/meal.dart";
import "package:meals_app/data/category.dart";
import "package:meals_app/data/favorites.dart";
import "package:meals_app/data/ingredient.dart";

class Recipe extends StatefulWidget {
  Recipe({
    super.key,
    required this.titolo,
    required this.cat,
    required this.id,
  }) {
    Category? category = categories[cat];
    Map<int, Meal> meals = category!.collection;
    Meal? m = meals[id];

    meal = m!;
    ingredients = m.ingredients;
    procedimento = m.procedimento;
  }

  final int cat;
  final int id;
  final String titolo;
  Meal meal = Meal(0, "", "", [], "");
  List<Ingredient> ingredients = [];
  String procedimento = "";

  State<Recipe> createState() {
    return _RecipeState();
  }
}

class _RecipeState extends State<Recipe> {
  void _addFavorites(int code) {
    bool isFavorite = false;
    if (favorites[widget.meal.id] == null) {
      favorites[code] = widget.meal;
      isFavorite = true;
    } else {
      favorites.remove(code);
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: isFavorite
            ? Text("Ti piace! :)")
            : Text("Non ti piace più! :("),
      ),
    );

    setState(() {
      favorites = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon star = Icon(Icons.star_border);
    if (favorites[widget.meal.id] != null) {
      //piatto preferito
      star = Icon(Icons.star);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titolo),
        actions: [
          IconButton(
            onPressed: () {
              _addFavorites(widget.meal.id);
            },
            icon: star,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Container(
            alignment: AlignmentGeometry.topCenter,
            child: Column(
              children: [
                Image(image: NetworkImage(widget.meal.url)),
                SizedBox(height: 30),
                Text("Ingredienti:", style: TextStyle(fontSize: 25)),
                SizedBox(height: 20),
                ...ingredients.map((i) {
                  return Text("* ${i.qta} ${i.um} di ${i.ingredient}");
                }),
                SizedBox(height: 30),
                Text("Procedimento:", style: TextStyle(fontSize: 25)),
                SizedBox(height: 20),
                Text(procedimento),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
