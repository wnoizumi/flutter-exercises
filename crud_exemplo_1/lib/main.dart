import 'package:crud_exemplo_1/navegacao_controller.dart';
import 'package:crud_exemplo_1/pessoa_controller.dart';
import 'package:crud_exemplo_1/pessoa_form.dart';
import 'package:crud_exemplo_1/pessoas_lista.dart';
import 'package:crud_exemplo_1/produtos_lista.dart';
import 'package:crud_exemplo_1/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PessoaController()),
        ChangeNotifierProvider(create: (context) => NavegacaoController()),
      ],
      child: MaterialApp(
        initialRoute: '/pessoas',
        //aqui definimos as rotas para todas as telas do app
        routes: Rotas.widgetsMap(),
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.lightBlue,
        ),
      ),
    );
  }
}
