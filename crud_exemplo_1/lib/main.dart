import 'package:crud_exemplo_1/pessoa_controller.dart';
import 'package:crud_exemplo_1/pessoa_form.dart';
import 'package:crud_exemplo_1/pessoas_lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PessoaController(),
      child: MaterialApp(
        initialRoute: '/',
        //aqui definimos as rotas para todas as telas do app
        routes: {
          '/': (context) => PessoasLista(),
          '/add_pessoa': (context) => PessoaForm(),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.lightBlue,
        ),
      ),
    );
  }
}
