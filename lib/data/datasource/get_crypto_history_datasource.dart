import '../../domain/entities/crypto_entity.dart';

abstract class GetCryptoHistoryDatasource {
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity);
}
