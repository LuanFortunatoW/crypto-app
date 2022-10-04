import '../../domain/repositories/get_crypto_history_repository.dart';
import '../enpoint/get_crypto_history_endpoint.dart';
import '../responses/get_crypto_history_response.dart';

class GetCryptoHistoryRepositoryImp implements GetCryptoHistoryRepository {
  final GetCryptoHistoryEndpoint _endpoint;
  GetCryptoHistoryRepositoryImp(this._endpoint);

  @override
  Future<GetCryptoHistoryResponse> getCryptoHistory(String id) async {
    final response = await _endpoint.getCryptoHistory(id);
    return GetCryptoHistoryResponse.fromJson(response.data);
  }
}
