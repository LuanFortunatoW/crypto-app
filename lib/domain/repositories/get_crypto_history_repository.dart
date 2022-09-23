import '../entities/crypto_entity.dart';

abstract class GetCryptoHistoryRepository {
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity);
}
