import "package:flutter/material.dart";
import "package:meals_app/widget/meal_image.dart";
import "package:meals_app/widget/meal_text.dart";
import "package:meals_app/screen/recipe.dart";

class MealCard extends StatefulWidget {
  const MealCard({
    super.key,
    required this.category,
    required this.id,
    required this.image,
    required this.descrizione,
    this.updateFavorites,
  });

  final int category;
  final int id;
  final String image;
  final String descrizione;
  final void Function(Map<int, List<int>>)? updateFavorites;

  State<MealCard> createState() {
    return _MealCardState();
  }
}

class _MealCardState extends State<MealCard> {
  void openRecipe(String titolo, int category, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Recipe(
            key: ValueKey(id),
            titolo: titolo,
            cat: category,
            id: id,
            updateFavorites: widget.updateFavorites,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            //print(widget.id);
            return openRecipe(widget.descrizione, widget.category, widget.id);
          },
          splashColor: Color.fromARGB(255, 0, 0, 100),
          child: SizedBox(
            width: 300,
            height: 200,
            child: Center(
              child: Stack(
                children: [
                  MealImage(image: widget.image),
                  MealText(descrizione: widget.descrizione),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
