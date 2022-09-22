import 'package:dio/dio.dart';

class GetCryptoHistoryEndpoint {
  final Dio _dio;
  GetCryptoHistoryEndpoint(this._dio);

  Future<Response> getCryptoHistory(String id) {
    return _dio.get(
      'https://api.coingecko.com/api/v3/coins/$id/market_chart',
      queryParameters: {
        'vs_currency': 'brl',
        'days': 90,
      },
    );
  }
}
