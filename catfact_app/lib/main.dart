import 'package:catfact_app/cat_facts_screen.dart';
import 'package:catfact_app/catfacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatfactsController(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: const CatfactsScreen(),
      ),
    );
  }
}
