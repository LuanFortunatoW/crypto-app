import 'package:dio/dio.dart';

import '../get_crypto_history_endpoint.dart';

class GetCryptoHistoryRemoteEndpointImp implements GetCryptoHistoryEndpoint {
  final Dio _dio;
  final String _url;

  GetCryptoHistoryRemoteEndpointImp(this._dio, this._url);

  @override
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
