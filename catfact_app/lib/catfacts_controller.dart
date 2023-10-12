import 'package:catfact_app/catfacts_api_gateway.dart';
import 'package:flutter/material.dart';

class CatfactsController extends ChangeNotifier {
  final CatfactsApiGateway apiGateway = CatfactsApiGateway();

  String _currentFact = "No cat fact yet";
  String get currentFact => _currentFact;

  CatfactsController() {
    fetchNewFact();
  }

  void fetchNewFact() async {
    _currentFact =
        (await apiGateway.fetchCatfact()) ?? "No new cat fact found :(";
    notifyListeners();
  }
}
