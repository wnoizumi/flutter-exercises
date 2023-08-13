import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
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
                  leading: IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () async {
                        if (await confirm(
                          context,
                          title: const Text('Confirm'),
                          content: const Text('Would you like to remove?'),
                          textOK: const Text('Yes'),
                          textCancel: const Text('No'),
                        )) {
                          return appState.updateFavoriteState(name);
                        }
                        return print('pressedCancel');
                      }),
                  title: Text(name.toLowerCase()),
                ))
            .toList()
      ],
    );
  }
}
