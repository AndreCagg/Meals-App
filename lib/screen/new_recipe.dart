import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:meals_app/data/categories.dart";
import "dart:convert";

class NewRecipe extends StatelessWidget {
  NewRecipe({super.key});
  final _formKey = GlobalKey<FormState>();

  void salvaRicetta() {
    _formKey.currentState!.save();

    http.post(
      Uri.https("mealsapp-f5e42-default-rtdb.firebaseio.com", "meals.json"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "categoria": _categoria,
        "titolo": _titolo,
        "procedimento": _procedimento,
      }),
    );
  }

  late String _titolo;
  late String _procedimento;
  late int _categoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nuova ricetta")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(label: Text("Titolo del piatto")),
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _titolo = newValue;
                      print(_titolo);
                    }
                  },
                ),
                SizedBox(height: 20),
                DropdownMenu(
                  onSelected: (newValue) {
                    if (newValue != null) {
                      _categoria = newValue;
                    }
                  },
                  dropdownMenuEntries: [
                    ...categories.keys.toList().map(
                      (id) => DropdownMenuEntry(
                        value: id,
                        label: categories[id]!.nome,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: 30,
                  decoration: InputDecoration(
                    label: Text("Descrivi il procedimento"),
                  ),
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _procedimento = newValue;
                      print(_procedimento);
                    }
                  },
                ),
                SizedBox(height: 50),
                FilledButton.tonal(
                  onPressed: salvaRicetta,
                  child: Text("Crea"),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
