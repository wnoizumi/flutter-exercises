import 'package:crud_exemplo_1/pessoa_form.dart';
import 'package:crud_exemplo_1/pessoas_lista.dart';
import 'package:crud_exemplo_1/produtos_lista.dart';
import 'package:flutter/material.dart';

class Rotas {
  //Rotas principais
  static const String PESSOAS = '/pessoas';
  static const String PRODUTOS = '/produtos';

  //Sub-rotas
  static const String PESSOAS_ADD = '/pessoas/add';

  //Mapeamento de rotas para telas
  static Map<String, WidgetBuilder> widgetsMap() {
    return {
      PESSOAS: (context) => const PessoasLista(),
      PESSOAS_ADD: (context) => PessoaForm(),
      PRODUTOS: (context) => const ProdutosLista(),
    };
  }
}
