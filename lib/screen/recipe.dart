import "package:flutter/material.dart";
import "package:meals_app/data/categories.dart";
import "package:meals_app/data/meal.dart";
import "package:meals_app/data/category.dart";
import "package:meals_app/data/favorites.dart";
import "package:meals_app/data/ingredient.dart";
import "package:meals_app/provider/favorites_provider.dart";

class Recipe extends StatefulWidget {
  Recipe({
    super.key,
    required this.titolo,
    required this.cat,
    required this.id,
    this.updateFavorites,
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
  void Function(Map<int, List<int>>)? updateFavorites;

  State<Recipe> createState() {
    return _RecipeState();
  }
}

class _RecipeState extends State<Recipe> {
  final FavoritesProvider _favoritesProvider = provider;
  Icon starIcon = Icon(Icons.star_border);

  void _addFavorites(int code) {
    bool isFavorite = false;
    /*if (favorites[widget.cat] == null) {
      favorites[widget.cat] = [widget.meal.id];
    } else {
      if (!favorites[widget.cat]!.contains(widget.meal.id)) {
        favorites[widget.cat]!.add(widget.meal.id);
        isFavorite = true;
      } else {
        //rimuoverlo
        favorites[widget.cat]!.remove(widget.meal.id);

        if (favorites[widget.cat]!.isEmpty) {
          favorites.remove(widget.cat);
        }

        if (widget.updateFavorites != null) {
          widget.updateFavorites!(favorites);
        }
      }

    }*/

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

    /*setState(() {
      favorites = favorites;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    //Icon starIcon = Icon(Icons.star);
    /*if (_favoritesProvider.favorites.isEmpty ||
        _favoritesProvider.favorites[widget.cat] == null ||
        !_favoritesProvider.favorites[widget.cat]!.contains(widget.meal.id)) {
      //piatto preferito
      starIcon = Icon(Icons.star_border);
    }*/
    if (_favoritesProvider.favorites.isNotEmpty &&
        _favoritesProvider.favorites[widget.cat] != null &&
        _favoritesProvider.favorites[widget.cat]!.contains(widget.meal.id)) {
      starIcon = Icon(Icons.star);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titolo),
        actions: [
          IconButton(
            onPressed: () {
              _addFavorites(widget.meal.id);
            },
            icon: starIcon,
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
