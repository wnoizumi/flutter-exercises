import 'dart:collection';

import 'package:crud_exemplo_1/pessoal_modelo.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier {
  final HashMap<String, PessoaModelo> _pessoas = HashMap();

  List<PessoaModelo> get pessoas => List.unmodifiable(_pessoas.values);

  void salvar(PessoaModelo pessoa) {
    _pessoas[pessoa.id] = pessoa;
    notifyListeners();
  }

  void excluir(PessoaModelo pessoa) {
    _pessoas.remove(pessoa.id);
    notifyListeners();
  }
}
