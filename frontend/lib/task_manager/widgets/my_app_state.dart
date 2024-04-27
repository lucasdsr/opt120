import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';

export 'my_app_state.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
  
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}