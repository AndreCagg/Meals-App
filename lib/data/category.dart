import "package:meals_app/data/meal.dart";

class Category {
  const Category({
    required this.code,
    required this.nome,
    required this.collection,
  });

  final int code;
  final String nome;
  final Map<int, Meal> collection;

  int get id {
    return code;
  }

  String get descrizione {
    return nome;
  }

  Map<int, Meal> get meals {
    return collection;
  }
}
