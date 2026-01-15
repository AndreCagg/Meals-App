import "package:flutter/material.dart";

class MealText extends StatelessWidget {
  const MealText({super.key, required this.descrizione});

  final String descrizione;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Color.fromARGB(199, 108, 108, 247),
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              descrizione,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
