import 'package:crypto_app/src/data/datasource/get_crypto_history_datasource.dart';
import 'package:crypto_app/src/domain/entities/crypto_entity.dart';

import '../../domain/repositories/get_crypto_history_repository.dart';

class GetCryptoHistoryRepositoryImp implements GetCryptoHistoryRepository {
  final GetCryptoHistoryDatasource _datasource;
  GetCryptoHistoryRepositoryImp(this._datasource);

  @override
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity) {
    return _datasource.getCryptoHistory(cryptoEntity);
  }
}
