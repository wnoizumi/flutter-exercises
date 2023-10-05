import 'package:flutter/material.dart';

import 'menu_navegacao.dart';

class ProdutosLista extends StatefulWidget {
  @override
  State<ProdutosLista> createState() => _ProdutosListaState();
}

class _ProdutosListaState extends State<ProdutosLista> {
  @override
  Widget build(BuildContext context) {
    // TODO: implementar
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const MenuNavegacao(),
        appBar: AppBar(
          title: const Text('Cadastro de Produtos'),
        ),
        body: Container(),
      ),
    );
  }
}
