import '../../entities/crypto_entity.dart';
import '../../repositories/get_crypto_history_repository.dart';
import 'get_crypto_history_usecase.dart';

class GetCryptoHistoryUsecaseImp implements GetCryptoHistoryUsecase {
  final GetCryptoHistoryRepository _repository;
  GetCryptoHistoryUsecaseImp(this._repository);

  @override
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity) {
    return _repository.getCryptoHistory(cryptoEntity);
  }
}
