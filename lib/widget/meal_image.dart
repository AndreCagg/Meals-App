import "package:flutter/material.dart";

class MealImage extends StatelessWidget {
  const MealImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Image(image: NetworkImage(image)),
    );
  }
}
