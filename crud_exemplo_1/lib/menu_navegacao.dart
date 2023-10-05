import 'package:crud_exemplo_1/navegacao_controller.dart';
import 'package:crud_exemplo_1/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuNavegacao extends StatefulWidget {
  const MenuNavegacao({super.key});

  @override
  State<MenuNavegacao> createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {
  String _getRotaSelecionada(int index) {
    return {
          0: Rotas.PESSOAS,
          1: Rotas.PRODUTOS,
        }[index] ??
        Rotas.PESSOAS;
  }

  @override
  Widget build(BuildContext context) {
    var navegacaoController = Provider.of<NavegacaoController>(context);

    return NavigationBar(
      onDestinationSelected: (int index) {
        navegacaoController.atualizarPaginaSelecionada(index);
        Navigator.pushReplacementNamed(context, _getRotaSelecionada(index));
      },
      indicatorColor: Colors.blue[800],
      selectedIndex: navegacaoController.paginaSelecionada,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.person_2),
          icon: Icon(Icons.person_2_outlined),
          label: 'Pessoas',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.store),
          icon: Icon(Icons.store_outlined),
          label: 'Produtos',
        ),
      ],
    );
  }
}
