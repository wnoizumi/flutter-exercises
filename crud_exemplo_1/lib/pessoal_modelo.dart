class PessoaModelo {
  String nome;
  String email;
  DateTime dataNascimento;
  String genero;
  String telefone;
  String endereco;

  PessoaModelo(
      {required this.nome,
      required this.email,
      required this.dataNascimento,
      required this.genero,
      required this.telefone,
      required this.endereco});

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
