import '../../../data/responses/mappers/crypto_entity_mapper.dart';

import '../../entities/wallet_entity.dart';
import '../../repositories/get_all_cryptos_repository.dart';
import 'get_all_cryptos_usecase.dart';

class GetAllCryptosUsecaseImp implements GetAllCryptosUsecase {
  final GetAllCryptosRepository _repository;
  GetAllCryptosUsecaseImp(this._repository);
  @override
  Future<WalletEntity> getAllCryptos() async {
    final response = await _repository.getAllCryptos();
    return response.toViewData();
  }
}
