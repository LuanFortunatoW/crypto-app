import '../../entities/crypto_entity.dart';

abstract class GetCryptoHistoryUsecase {
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity);
}
