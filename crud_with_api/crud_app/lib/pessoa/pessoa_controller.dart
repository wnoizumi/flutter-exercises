import 'package:crud_app/pessoa/pessoa_gateway.dart';
import 'package:crud_app/pessoa/pessoal_modelo.dart';
import 'package:crud_app/usuario/usuario_model.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier {
  final PessoaApiGateway _pessoaApiGateway = PessoaApiGateway();

  List<PessoaModelo>? _pessoas;

  List<PessoaModelo> get pessoas => List.unmodifiable(_pessoas ?? []);

  void buscarPessoas(UsuarioModelo usuario) async {
    _pessoas = await _pessoaApiGateway.fetchAllPessoas(usuario);
    notifyListeners();
  }

  void salvar(PessoaModelo pessoa) {
    if (pessoa.id != null) {
      //atualizar
    } else {
      //incluir
    }

    notifyListeners();
  }

  void excluir(PessoaModelo pessoa) {
    notifyListeners();
  }
}
