import '../../domain/entities/crypto_history_entity.dart';
import '../../domain/repositories/get_crypto_history_repository.dart';
import '../datasource/get_crypto_history_datasource.dart';

class GetCryptoHistoryRepositoryImp implements GetCryptoHistoryRepository {
  final GetCryptoHistoryDatasource _datasource;
  GetCryptoHistoryRepositoryImp(this._datasource);

  @override
  Future<List<CryptoHistoryEntity>> getCryptoHistory(String id) {
    return _datasource.getCryptoHistory(id);
  }
}
