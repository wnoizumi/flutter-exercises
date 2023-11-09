import 'package:crud_app/pessoa/pessoa_form.dart';
import 'package:crud_app/pessoa/pessoas_lista.dart';
import 'package:crud_app/usuario/login_form.dart';
import 'package:flutter/material.dart';

class Rotas {
  //Rotas principais
  static const String LOGIN = '/login';
  static const String REGISTRAR = '/registrar';
  static const String PESSOAS = '/pessoas';

  //Sub-rotas
  static const String PESSOAS_ADD = '/pessoas/add';

  //Mapeamento de rotas para telas
  static Map<String, WidgetBuilder> widgetsMap() {
    return {
      PESSOAS: (context) => const PessoasLista(),
      PESSOAS_ADD: (context) => PessoaForm(),
      LOGIN: (context) => const LoginForm(),
    };
  }
}
