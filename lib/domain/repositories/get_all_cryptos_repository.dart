import '../../data/responses/get_all_crypto_response.dart';

abstract class GetAllCryptosRepository {
  Future<GetAllCryptosResponse> getAllCryptos();
}
