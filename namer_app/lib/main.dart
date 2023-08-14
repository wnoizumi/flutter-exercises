import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namer_app/widgets/my_app.dart';
import 'package:window_size/window_size.dart';

void main() async {
  setupWindow();
  await initHive();
  runApp(const MyApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  var namesBox = await Hive.openBox('names');
  if (namesBox.get('current') == null) {
    namesBox.put('current', WordPair.random().toString());
  }
  if (namesBox.get('favorites') == null) {
    namesBox.put('favorites', <dynamic>[]);
  }
}

const double windowWidth = 800;
const double windowHeight = 854;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Form Samples');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}
