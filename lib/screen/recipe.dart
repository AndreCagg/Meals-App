import "package:flutter/material.dart";
import "package:meals_app/data/categories.dart";
import "package:meals_app/data/meal.dart";
import "package:meals_app/data/category.dart";
import "package:meals_app/data/favorites.dart";
import "package:meals_app/data/ingredient.dart";
import "package:meals_app/provider/favorites_provider.dart";
import "package:provider/provider.dart";

class Recipe extends StatefulWidget {
  Recipe({
    super.key,
    required this.titolo,
    required this.cat,
    required this.id,
    //this.updateFavorites,
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
  //void Function(Map<int, List<int>>)? updateFavorites;

  State<Recipe> createState() {
    return _RecipeState();
  }
}

class _RecipeState extends State<Recipe> {
  Icon starIcon = Icon(Icons.star_border);

  void _addFavorites(int code) {
    final FavoritesProvider _favoritesProvider = context
        .read<FavoritesProvider>();
    bool isFavorite = false;
    isFavorite = _favoritesProvider.manageFavorite(widget.cat, widget.meal.id);

    if (isFavorite) {
      setState(() {
        starIcon = Icon(Icons.star);
      });
    } else {
      setState(() {
        starIcon = Icon(Icons.star_border);
      });
    }
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: isFavorite
            ? Text("Ti piace! :)")
            : Text("Non ti piace più! :("),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider _favoritesProvider = context
        .read<FavoritesProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titolo),
        actions: [
          IconButton(
            onPressed: () {
              _addFavorites(widget.meal.id);
            },
            icon: Consumer<FavoritesProvider>(
              builder: (context, provider, child) {
                return provider.isFavorite(widget.cat, widget.meal.id)
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border);
              },
            ),
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
