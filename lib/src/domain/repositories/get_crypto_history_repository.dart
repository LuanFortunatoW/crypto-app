import 'package:crypto_app/src/domain/entities/crypto_entity.dart';

abstract class GetCryptoHistoryRepository {
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity);
}
