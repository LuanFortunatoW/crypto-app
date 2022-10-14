import '../../domain/repositories/get_all_cryptos_repository.dart';
import '../enpoint/get_all_cryptos_enpoint.dart';
import '../responses/crypto_response.dart';
import '../responses/get_all_crypto_response.dart';

class GetAllCryptoRepositoryImp implements GetAllCryptosRepository {
  final GetAllCryptosEnpoint _endpoint;
  GetAllCryptoRepositoryImp(this._endpoint);

  @override
  Future<GetAllCryptosResponse> getAllCryptos(String vsCurrency) async {
    final respose = await _endpoint.getAllCryptos(vsCurrency);
    return GetAllCryptosResponse(List.from(respose.data)
        .map((e) => CryptoResponse.fromJson(e))
        .toList());
  }
}
