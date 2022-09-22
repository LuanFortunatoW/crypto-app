import 'package:crypto_app/domain/entities/crypto_history_entity.dart';

abstract class GetCryptoHistoryRepository {
  Future<List<CryptoHistoryEntity>> getCryptoHistory(String id);
}
