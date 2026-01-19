import "package:flutter/material.dart";

class FavoritesProvider extends ChangeNotifier {
  final Map<int, List<int>> _favorites = {};

  Map<int, List<int>> get favorites {
    return _favorites;
  }

  bool manageFavorite(int category, int meal) {
    if (_favorites[category] == null) {
      _favorites[category] = [meal];
    } else {
      if (!_favorites[category]!.contains(meal)) {
        _favorites[category]!.add(meal);
      } else {
        //rimuovi
        _deleteFavorite(category, meal);
        notifyListeners();
        return false;
      }
    }

    notifyListeners();

    return true;
  }

  void _deleteFavorite(int category, int meal) {
    _favorites[category]!.remove(meal);
    if (_favorites[category]!.isEmpty) {
      _favorites.remove(category);
    }
    notifyListeners();
  }

  bool isFavorite(int category, int meal) {
    if (_favorites.isNotEmpty &&
        _favorites[category] != null &&
        _favorites[category]!.contains(meal)) {
      return true;
    }

    return false;
  }
}

FavoritesProvider provider = FavoritesProvider();
