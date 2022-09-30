import '../../entities/crypto_history_entity.dart';

abstract class GetCryptoHistoryUsecase {
  Future<List<CryptoHistoryEntity>> getCryptoHistory(String id);
}
