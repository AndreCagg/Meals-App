import "package:flutter/material.dart";
import "package:meals_app/screen/category_meals.dart";

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.code, required this.category});
  final int code;
  final String category;

  State<CategoryCard> createState() {
    return _CategoryCardState();
  }
}

class _CategoryCardState extends State<CategoryCard> {
  void exploreCategory(final int code) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CategoryMeals.Category(category: code);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        //splashColor: Color.fromARGB(255, 188, 214, 188),
        onTap: () {
          exploreCategory(widget.code);
        },
        child: SizedBox(
          width: 100,
          height: 100,
          child: Center(child: Text(widget.category)),
        ),
      ),
    );
  }
}
