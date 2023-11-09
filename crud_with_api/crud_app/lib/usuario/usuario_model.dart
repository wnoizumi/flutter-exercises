import 'dart:convert';

class UsuarioModelo {
  final String usuario;
  final String senha;

  UsuarioModelo(this.usuario, this.senha);

  String toBase64() {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode("$usuario:$senha");
  }
}
