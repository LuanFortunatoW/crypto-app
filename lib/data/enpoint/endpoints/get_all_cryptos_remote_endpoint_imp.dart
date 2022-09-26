import 'package:dio/dio.dart';

import '../get_all_cryptos_enpoint.dart';

class GetAllCryptosRemoteEndpointImp implements GetAllCryptosEnpoint {
  final Dio _dio;
  final String _url;
  GetAllCryptosRemoteEndpointImp(this._dio, this._url);

  @override
  Future<Response> getAllCryptos() async {
    return await _dio.get(
      '$_url/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
      },
    );
  }
}
