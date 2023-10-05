import 'package:crud_exemplo_1/menu_navegacao.dart';
import 'package:crud_exemplo_1/pessoa_controller.dart';
import 'package:crud_exemplo_1/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PessoasLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pessoaController = Provider.of<PessoaController>(context);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const MenuNavegacao(),
        appBar: AppBar(
          title: const Text('Cadastro de Pessoas'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //aqui definimos a rota da tela a ser aberta
            Navigator.pushNamed(context, Rotas.PESSOAS_ADD);
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView.builder(
            itemCount: pessoaController.pessoas.length,
            itemBuilder: (BuildContext context, int index) {
              final pessoa = pessoaController.pessoas[index];
              return Card(
                margin: const EdgeInsets.all(8),
                // incluir um botão para excluir neste card
                child: ListTile(
                  title: Text('Nome: ${pessoa.nome}'),
                  subtitle: Text('Email: ${pessoa.email}'),
                  onTap: () {
                    // abrir a tela para alterar pessoa
                  },
                ),
              );
              ;
            },
          ),
        ),
      ),
    );
  }
}
