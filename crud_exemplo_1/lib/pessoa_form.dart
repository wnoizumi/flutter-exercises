import 'package:crud_exemplo_1/pessoa_controller.dart';
import 'package:crud_exemplo_1/pessoal_modelo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PessoaForm extends StatefulWidget {
  const PessoaForm({super.key});

  @override
  _PessoaFormState createState() => _PessoaFormState();
}

class _PessoaFormState extends State<PessoaForm> {
  //Identificador global deste form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final formatoData = DateFormat('dd/MM/yyyy');
  final maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  String nome = '';
  DateTime? dataNascimento;
  String departamento = '';
  String email = '';
  String telefone = '';
  String endereco = '';

  // Função para mostrar o calendário
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? selecionado = await showDatePicker(
      context: context,
      initialDate: dataNascimento ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selecionado != null && selecionado != dataNascimento) {
      setState(() {
        dataNascimento = selecionado;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Para acessarmos o controller que gerencia os dados de pessoa
    final pessoaController = Provider.of<PessoaController>(context);

    // Formatando a data selecionada para mostrar
    final dataNascimentoFormatada =
        dataNascimento == null ? '' : formatoData.format(dataNascimento!);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar Pessoa'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            //aqui especificamos o identificador do form
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Informe o nome';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nome = value!;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: const InputDecoration(
                              labelText: 'Data de Nascimento'),
                          controller: TextEditingController(
                              text: dataNascimentoFormatada),
                          validator: (value) {
                            if (dataNascimento == null) {
                              return 'Selecione a data de nascimento';
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {
                          _selecionarData(context);
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Departamento'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Digite o departamento';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      departamento = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Digite o email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  TextFormField(
                    inputFormatters: [maskFormatter],
                    decoration: const InputDecoration(labelText: 'Telefone'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Digite o telefone';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      telefone = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Endereço'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Digite o endereço';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      endereco = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        pessoaController.incluir(PessoaModelo(
                            nome: nome,
                            email: email,
                            dataNascimento: dataNascimento!,
                            departamento: departamento,
                            telefone: telefone,
                            endereco: endereco));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
