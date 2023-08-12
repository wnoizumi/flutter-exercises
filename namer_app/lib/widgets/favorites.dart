import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/my_app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.getFavorites();

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorites.length} favorites:'),
        ),
        ...favorites
            .map((name) => ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(name.toLowerCase()),
                ))
            .toList()
      ],
    );
  }
}
