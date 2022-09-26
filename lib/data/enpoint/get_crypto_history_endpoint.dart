import 'package:dio/dio.dart';

abstract class GetCryptoHistoryEndpoint {
  Future<Response> getCryptoHistory(String id);
}
