import '../../domain/entities/crypto_history_entity.dart';

abstract class GetCryptoHistoryDatasource {
  Future<List<CryptoHistoryEntity>> getCryptoHistory(String id);
}
