import '../../data/responses/get_crypto_history_response.dart';

abstract class GetCryptoHistoryRepository {
  Future<GetCryptoHistoryResponse> getCryptoHistory(String id);
}
