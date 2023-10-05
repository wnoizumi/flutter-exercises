import 'package:flutter/material.dart';

class NavegacaoController extends ChangeNotifier {
  int _paginaSelecionada = 0;

  int get paginaSelecionada => _paginaSelecionada;

  void atualizarPaginaSelecionada(int index) {
    _paginaSelecionada = index;
    notifyListeners();
  }
}
