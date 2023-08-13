import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyAppState extends ChangeNotifier {
  String getCurrent() {
    var namesBox = Hive.box('names');
    return namesBox.get('current');
  }

  List<dynamic> getFavorites() {
    var namesBox = Hive.box('names');
    return namesBox.get('favorites');
  }

  void getNext() {
    var namesBox = Hive.box('names');
    namesBox.put('current', WordPair.random().toString());
    notifyListeners();
  }

  void toggleFavorite() {
    var namesBox = Hive.box('names');
    var favorites = namesBox.get('favorites');
    var current = namesBox.get('current');
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    namesBox.put('favorites', favorites);
    notifyListeners();
  }

  void updateFavoriteState(String name) {
    var namesBox = Hive.box('names');
    var favorites = namesBox.get('favorites');
    if (favorites.contains(name)) {
      favorites.remove(name);
    } else {
      favorites.add(name);
    }
    namesBox.put('favorites', favorites);
    notifyListeners();
  }
}
