import 'package:flutter/material.dart';
import 'package:namer_app/widgets/home.dart';
import 'package:namer_app/state/my_app_state.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
        home: HomePage(),
      ),
    );
  }
}
