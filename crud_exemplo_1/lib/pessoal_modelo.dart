class PessoaModelo {
  String nome;
  String email;
  DateTime dataNascimento;
  String departamento;
  String telefone;
  String endereco;
  String id;

  PessoaModelo(
      {required this.nome,
      required this.email,
      required this.dataNascimento,
      required this.departamento,
      required this.telefone,
      required this.endereco,
      required this.id});

  @override
  int get hashCode => email.hashCode;

  @override
  bool operator ==(Object other) {
    if (PessoaModelo != other.runtimeType) {
      return false;
    }
    other as PessoaModelo;
    return email == other.email;
  }
}
