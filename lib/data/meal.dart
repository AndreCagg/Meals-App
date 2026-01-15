import "package:meals_app/data/ingredient.dart";

class Meal {
  const Meal(
    this._id,
    this._descrizione,
    this._url,
    this._ingredients,
    this._procedimento,
  );
  final int _id;
  final String _descrizione;
  final String _url;
  final List<Ingredient> _ingredients;
  final String _procedimento;

  int get id {
    return _id;
  }

  String get descrizione {
    return _descrizione;
  }

  String get url {
    return _url;
  }

  List<Ingredient> get ingredients {
    return _ingredients;
  }

  String get procedimento {
    return _procedimento;
  }
}
