import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'catfacts_controller.dart';

class CatfactsScreen extends StatelessWidget {
  const CatfactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<CatfactsController>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Catfacts App")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/cat_1.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 20),
                      textAlign: TextAlign.justify,
                      controller.currentFact),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () => controller.fetchNewFact(),
                    icon: const Icon(Icons.refresh_rounded),
                  ),
                  IconButton.filled(
                    onPressed: () => Clipboard.setData(
                        ClipboardData(text: controller.currentFact)),
                    icon: const Icon(Icons.copy_all_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
