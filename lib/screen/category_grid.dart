import "package:flutter/material.dart";
import "package:meals_app/widget/category_card.dart";
import "package:meals_app/data/categories.dart";

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryList = categories.values.toList();
    return GridView.builder(
      itemCount: categoryList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return CategoryCard(
          code: categoryList[index].code,
          category: categoryList[index].descrizione,
        );
      },
    );
  }
}
