import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class CatfactsApiGateway {
  static const CATFACTS_API_URL = "https://catfact.ninja/fact";
  final dio = Dio();
  final log = Logger('CatfactsApiGateway');

  Future<String?> fetchCatfact() async {
    try {
      var response = await dio.get(CATFACTS_API_URL);
      if (response.data != null && response.data['fact'] != null) {
        return response.data['fact'];
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
