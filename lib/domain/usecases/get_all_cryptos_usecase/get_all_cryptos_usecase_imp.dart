import '../../entities/wallet_entity.dart';
import '../../repositories/get_all_cryptos_repository.dart';
import 'get_all_cryptos_usecase.dart';

class GetAllCryptosUsecaseImp implements GetAllCryptosUsecase {
  final GetAllCryptosRepository _repository;
  GetAllCryptosUsecaseImp(this._repository);
  @override
  WalletEntity getAllCryptos() {
    return _repository.getAllCryptos();
  }
}
