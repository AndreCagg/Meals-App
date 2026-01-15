class Ingredient {
  const Ingredient(this._um, this._qta, this._ingredient);

  final String _um;
  final double _qta;
  final String _ingredient;

  String get um {
    return _um;
  }

  double get qta {
    return _qta;
  }

  String get ingredient {
    return _ingredient;
  }
}
