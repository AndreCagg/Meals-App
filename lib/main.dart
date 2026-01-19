import 'package:flutter/material.dart';
import "package:meals_app/meals_app.dart";
import "package:provider/provider.dart";
import "package:meals_app/provider/favorites_provider.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MealsApp());
  }
}
