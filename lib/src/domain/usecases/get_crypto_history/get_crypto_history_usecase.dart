import 'package:crypto_app/src/domain/entities/crypto_entity.dart';

abstract class GetCryptoHistoryUsecase {
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity);
}
