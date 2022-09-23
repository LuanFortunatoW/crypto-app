import 'package:dio/dio.dart';

class GetCryptoHistoryEndpoint {
  final Dio _dio;
  final String _url;
  GetCryptoHistoryEndpoint(this._dio, this._url);

  Future<Response> getCryptoHistory(String id) {
    return _dio.get(
      '$_url/coins/$id/market_chart',
      queryParameters: {
        'vs_currency': 'brl',
        'days': 90,
        'interval': 'daily',
      },
    );
  }
}
