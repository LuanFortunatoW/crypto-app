import 'package:dio/dio.dart';

class GetAllCryptosEndpoint {
  final Dio _dio;
  GetAllCryptosEndpoint(this._dio);

  Future<Response> getAllCryptos() async {
    return await _dio.get(
      'https://api.coingecko.com/api/v3/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
      },
    );
  }
}
