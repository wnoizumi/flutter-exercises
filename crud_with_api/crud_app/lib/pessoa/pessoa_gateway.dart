import 'package:crud_app/pessoa/pessoal_modelo.dart';
import 'package:crud_app/usuario/usuario_model.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class PessoaApiGateway {
  static const PESSOA_API_URL = "http://localhost:8080/geral/pessoas";
  final dio = Dio();
  final log = Logger('PessoaApiGateway');

  Future<List<PessoaModelo>?> fetchAllPessoas(UsuarioModelo usuario) async {
    try {
      Map<String, dynamic> headers = {
        'authorization': 'Basic ${usuario.toBase64()}',
      };
      var response = await dio.get(
        PESSOA_API_URL,
        options: Options(headers: headers),
      );
      if (response.data != null) {
        var result = (response.data as List).map((item) {
          return PessoaModelo.fromJson(item);
        }).toList();

        return result;
      }
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log.severe(e.response!.data);
        log.severe(e.response!.headers);
        log.severe(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        log.severe(e.requestOptions);
        log.severe(e.message);
      }
    }
    return null;
  }
}
