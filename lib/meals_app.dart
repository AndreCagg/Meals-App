import "package:flutter/material.dart";
import "package:meals_app/screen/category_grid.dart";
import "package:meals_app/screen/preferiti.dart";

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  State<MealsApp> createState() {
    return _MealsAppState();
  }
}

class _MealsAppState extends State<MealsApp> {
  int _selectedIndex = 0;
  Widget? content = CategoryGrid();
  Widget scaffoldTitle = Text("Categorie");

  void _onSelected(int index) {
    Widget activePage;
    Widget appTitle;

    if (index == 1) {
      //preferiti
      activePage = Preferiti();
      appTitle = Text("Preferiti");
    } else {
      activePage = CategoryGrid();
      appTitle = Text("Categorie");
    }

    setState(() {
      _selectedIndex = index;
      content = activePage;
      scaffoldTitle = appTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: scaffoldTitle),
      body: Padding(padding: EdgeInsetsGeometry.all(20), child: content),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Preferiti",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onSelected(index);
        },
      ),
    );
  }
}
