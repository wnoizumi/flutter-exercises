import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namer_app/widgets/my_app.dart';

void main() async {
  await Hive.initFlutter();
  var namesBox = await Hive.openBox('names');
  if (namesBox.get('current') == null) {
    namesBox.put('current', WordPair.random().toString());
  }
  if (namesBox.get('favorites') == null) {
    namesBox.put('favorites', <dynamic>[]);
  }
  runApp(const MyApp());
}
