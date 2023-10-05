import 'package:crud_exemplo_1/pessoal_modelo.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier {
  final Set<PessoaModelo> _pessoas = {};

  List<PessoaModelo> get pessoas => List.unmodifiable(_pessoas);

  void incluir(PessoaModelo pessoa) {
    _pessoas.add(pessoa);
    notifyListeners();
  }
}
