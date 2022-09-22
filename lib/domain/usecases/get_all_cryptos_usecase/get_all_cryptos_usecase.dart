import '../../entities/wallet_entity.dart';

abstract class GetAllCryptosUsecase {
  Future<WalletEntity> getAllCryptos();
}
