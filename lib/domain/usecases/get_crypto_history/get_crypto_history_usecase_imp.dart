import '../../entities/crypto_history_entity.dart';
import '../../repositories/get_crypto_history_repository.dart';
import 'get_crypto_history_usecase.dart';

class GetCryptoHistoryUsecaseImp implements GetCryptoHistoryUsecase {
  final GetCryptoHistoryRepository _repository;
  GetCryptoHistoryUsecaseImp(this._repository);

  @override
  Future<List<CryptoHistoryEntity>> getCryptoHistory(String id) {
    return _repository.getCryptoHistory(id);
  }
}
