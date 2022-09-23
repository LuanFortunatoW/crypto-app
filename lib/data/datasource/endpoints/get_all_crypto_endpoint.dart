import 'package:dio/dio.dart';

class GetAllCryptosEndpoint {
  final Dio _dio;
  final String _url;
  GetAllCryptosEndpoint(this._dio, this._url);

  Future<Response> getAllCryptos() async {
    return await _dio.get(
      '$_url/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
      },
    );
  }
}
