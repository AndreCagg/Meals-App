import "package:flutter/cupertino.dart";
import "package:meals_app/data/category.dart";
import "package:meals_app/data/meal.dart";
import "package:meals_app/data/ingredient.dart";

String url =
    "https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6-300x188.png";

List<Ingredient> ingredients = [Ingredient("gr", 100, "i_1")];

String procedimento =
    "Eh1gXEAc3vMVPSvQNac4h699fgCKAFGVz9bCGHfk24MefcWwK4hapKe9DS41xHtcLTqSbpfPSpWpDqMWEAw517fAcLZkmADGehuDjrAdH4dB24xSSLvkdm2v2kqdkmTPihpdV9YpHNaYAn0QyQzpZEX4504kQyF46yKbZVNDT9xZBQFcXwyMykYRfGE3QteAbQFbrrAtJwfg5JbUTj2HDBS8CqAtqH3BfYnzUWcwFLAdaz3BSLhSWzXeVma7tcQYm2FrXBM5vG11QbWW5ycMNxWLRtZJKNkCC3zCLZFfCE2kEB3TSA436tmPwtCmjkHTdAAbpXu1bDeTUkm3rPZR8Ngui7RHStduVxxqqUjAm60dijrWiTidGJynkbXPR7BApzZKcYqY4tpcWC681bLWXkYukHkRKDX8Tfz9T37r80tabLwCPdiZnvF0DGy0Fz4F8GyiknRTUmtWXTzAAKk4t2YuKeJwPhSXHMJjgXBXG2BBwJtTLr6xZExYrH0Akfzp3qpj7AFmzhzD5becqLp0rAi7MNwV4h4SizBBmM8RrX7PGve468qeyP44tCqqhev1FL6h028WnXNTg5JaHmwWPdKxp0zfiFMntaywXn20J2hXp7XkZ7336DnnrihDFfbieVEiwVS92fcNyTMvuRjp9UqqQJ9eE6wSgMrmvTKc3xnaQn3PL16bAj26mdZXnz8xMkfg30XUBFmpeUkxZFR20ZmZY2Yca3JkkAZZQZEtBTVc3WFHyTq2v4dx7aBA6mfH8DCkyt2twdjeEMKGUQCmi8SywV3RLzkmkYTLwwQ3XrgCnyk92gFE1XCm1vzCBf9S0zL994i7SCPnd5geqPndgMA3zibidDf5y2WRuUufvcrcAa0vUCxhBNE1qNPXkT33N2bJnuzeGArqG6uQa6wYK63b6Hn7hR6C6TDPayJTrY14RzELUYMagG04eBcUnjgFxG6SDE6YViwTm3JQP3QrfPkU2xwVF1FzfGLUK67n";

var categories = {
  1: Category(
    code: 1,
    nome: "Carne",
    collection: {1: Meal(1, "Fiorentina", url, ingredients, procedimento)},
  ),

  2: Category(
    code: 2,
    nome: "Pesce",
    collection: {2: Meal(2, "Orata in crosta", url, ingredients, procedimento)},
  ),

  3: Category(
    code: 3,
    nome: "Italiano",
    collection: {
      3: Meal(3, "Spaghetti al pomodoro", url, ingredients, procedimento),
    },
  ),

  4: Category(
    code: 4,
    nome: "Cinese",
    collection: {4: Meal(4, "Cane fritto", url, ingredients, procedimento)},
  ),

  5: Category(
    code: 5,
    nome: "Giapponese",
    collection: {
      5: Meal(5, "Sushi", url, ingredients, procedimento),
      6: Meal(6, "Sushi", url, ingredients, procedimento),
    },
  ),
};
