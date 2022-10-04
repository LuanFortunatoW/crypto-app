import 'package:dio/dio.dart';

abstract class GetAllCryptosEnpoint {
  Future<Response> getAllCryptos(String vsCurrency);
}
