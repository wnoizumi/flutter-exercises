import 'package:crud_app/usuario/usuario_gateway.dart';
import 'package:crud_app/usuario/usuario_model.dart';
import 'package:flutter/material.dart';

class UsuarioController extends ChangeNotifier {
  UsuarioModelo? _usuarioLogado;
  final UsuarioApiGateway _usuarioApiGateway = UsuarioApiGateway();

  get usuarioLogado => _usuarioLogado;

  Future<bool> login(String usuario, String senha) async {
    _usuarioLogado = await _usuarioApiGateway.login(usuario, senha);
    notifyListeners();
    return _usuarioLogado != null;
  }
}
